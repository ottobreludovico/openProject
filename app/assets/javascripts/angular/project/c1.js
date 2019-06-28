var app = angular.module('angularOpenProject');

app.controller("c1", ["$http", "$scope" , function($http, $scope){
  
  
/*
  this.routeSub = this.route.params.subscribe(params => {
    console.log(params);
    console.log(+params['id']);
  }); 
*/
var user;
var currentProject=1;

function editState(item,new_state){
  var data= {
    "user_story": {
      "state": new_state
    }
  }
  $http.put('/user_stories/' + item.id, data);
}

/*
  var getData = function (id,index,param) {
    return $http({

      method: 'GET',
      url: '/users/'+id+'.json'

    }).then(function (user){
      console.log(user.data.first_name);
      if(index==0){
        param.creator=user.data.first_name;
      }else{
        param.worker=user.data.first_name;
      }  
      //console.log(user.data);           
    },function (error){
      alert("Si è verificato un errore!");
  });
}
  function getUser(id,index,param){
    $http({

          method: 'GET',
          url: '/users/'+id+'.json'

        }).then(function (user){
          console.log(user.data.first_name);
          if(index==0){
            param.creator=user.data.first_name;
          }else{
            param.worker=user.data.first_name;
          }  
          //console.log(user.data);           

        },function (error){

          alert("Si è verificato un errore!");
    });
  }*/


  $scope.title ="drag and drop";

  $scope.lists = [ {id: 1, name: "TODO", cards: []},
  {id: 2, name: "DOING",  cards: []},
  {id: 3, name: "DONE", cards: []}]

  

	$http({
		method: 'GET',
		url: '/projects/1.json'
	}).then(function(data){
    console.log(data);
    user=data.data.currentuser;
		for( var i = 0; i < data.data.stories.length; i ++ ){
      /*var info ={
        info :  "",
        creator: "",
        worker: ""
      };*/

      if(data.data.stories[i].state==0){
       //info.creator=getData(stories.data[i].creator_id,0,info);
       //info.worker=getData(stories.data[i].worker_id,1,info);
       //info.info=stories.data[i];
       //$scope.lists[0].cards.push(info);
       console.log(data.data.stories[i]);
       $scope.lists[0].cards.push(data.data.stories[i]);
     
      }else if(data.data.stories[i].state==1){
       //info.creator=getUser(stories.data[i].creator_id,0,info);
       //info.worker=getUser(stories.data[i].worker_id,1,info);
       //info.info=stories.data[i];
       //$scope.lists[1].cards.push(info);
       $scope.lists[1].cards.push(data.data.stories[i]);

      }else if(data.data.stories[i].state==2){
       //info.creator=getUser(stories.data[i].creator_id,0,info);
       //info.worker=getUser(stories.data[i].worker_id,1,info);
       //info.info=stories.data[i];
       //$scope.lists[2].cards.push(info);
       $scope.lists[2].cards.push(data.data.stories[i]);

      }
    }
  },function(error){
		console.log(error);
	});  
   
   $scope.dropCallbackItems = function(index, item, external, ind){
     console.log(index, item, external, ind)
   };
   
    $scope.dropCallback = function(index, item, external, ind) {
	  editState(item,index);
      console.log("drop",index, item, external, ind );
      console.log("drop", $scope.lists);
      $scope.draggedTo = index.toString()
      $scope.draggedItem = item;
      //do something here with list array and information
      // index is index of lists object where is card is droped
      //item is card object 
      //external is $scope.lists
      return item;
    };
    
    $scope.dragStart = function(ind){
      console.log(ind)
      
      $scope.draggedFrom = ind.toString()
    };

    $scope.newCard = function(){
    
      var title = document.getElementById('title').value;
      var description = document.getElementById('description').value;
      var data={
        "user_story": {
          "creator_id": user,
          "worker_id": null,
          "project_id": 1,
          "title": title,
          "description": description,
          "deadline": null,
          "state": 0
           } 
      }
      $http.post('/user_stories', data).then(function (response){
              console.log(response);
              $scope.lists[0].cards.push(data.user_story);
              document.getElementById('title').value="";
              document.getElementById('description').value="";
              console.log(data);
            },function (error){
        
      });
    }
  
}]);