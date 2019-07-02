var app = angular.module('angularOpenProject');

app.controller("c1", ["$http", "$scope" , function($http, $scope){
  
var user;
var currentProject;

function back (){
  window.location.reload(); 
};

$scope.today=new Date().toLocaleDateString();

function editState(item,new_state){
  var data= {
    "user_story": {
      "state": new_state
    }
  }
  $http.put('/user_stories/'+item.id+'.json', data).then(function (response){
    console.log("cambio di stato");
  },function(error){
    console.log(error);
  });
}

$scope.remove= function(id,item,index){
  $http.get('/user_stories/'+id+'/destroy').then(function (response){
    item.cards.splice(index, 1)
    console.log("rimosso");
  },function(error){
    console.log(error);
  });
}

$scope.lists = [ {id: 1, name: "TODO", cards: []},
{id: 2, name: "DOING",  cards: []},
{id: 3, name: "DONE", cards: []}]


$scope.init = (project_id) => {
  $http({
  method: 'GET',
  url: '/projects/'+project_id+'.json'
}).then(function(data){
  currentProject=project_id;
  user=data.data.currentuser;

  for( var i = 0; i < data.data.stories.length; i ++ ){

    if(data.data.stories[i].state==0){
      
      $scope.lists[0].cards.push(data.data.stories[i]);
      scaduto(data.data.stories[i]);
    }else if(data.data.stories[i].state==1){
      
      $scope.lists[1].cards.push(data.data.stories[i]);

    }else if(data.data.stories[i].state==2){
      
      $scope.lists[2].cards.push(data.data.stories[i]);

    }
  }
},function(error){
  console.log(error);
});
}
  

$scope.toUser = function(card_id ,id){
  var data= {
    "user_story": {
      "worker_id": id
    }
  }
  $http.put('/user_stories/'+card_id+'.json' , data).then(function (response){
    console.log(response);
    //back();
  },function(error){
    console.log(error);
  });
}

$scope.newDate = function(card_id, date){
  var data= {
    "user_story": {
      "deadline": date.deadline
    }
  }
  console.log(date.deadline);
  $http.put('/user_stories/'+card_id+'.json' , data).then(function (response){
    console.log(response);
    date.deadline="";
  },function(error){
    console.log(error);
  });
}

   
   $scope.dropCallbackItems = function(index, item, external, ind){
     console.log(index, item, external, ind)
   };
   
    $scope.dropCallback = function(index, item, external, ind) {
	    editState(item,index);
      console.log("drop",index, item, external, ind );
      console.log("drop", $scope.lists);
      $scope.draggedTo = index.toString()
      $scope.draggedItem = item;
      return item;
    };
    
    $scope.dragStart = function(ind){
      console.log(ind)
      
      $scope.draggedFrom = ind.toString()
    };

    $scope.newCard = function(c){
      var data={
        "user_story": {
          "creator_id": user,
          "project_id": currentProject,
          "title": c.title,
          "description": c.description,
          "state": 0
           } 
      }
      $http.post('/user_stories.json', data).then(function (response){
              data.user_story.id=response.data.user_story_id;
              $scope.lists[0].cards.push(data.user_story);
              $scope.c.title="";
              $scope.c.description="";
              console.log(data);
            },function (error){
        console.log(error);
      });
    }
  
}]);

$scope.today=new Date().toLocaleDateString();
$scope.newdate;

function scaduto (deadline){
  var newdate = deadline.deadline.toString().split("-").reverse().join("/");
  var today=new Date().toLocaleDateString();
  var n=newdate.toString().split("/");
  var t=today.toString().split("/");
  console.log(n[2]);
  console.log(t[2]);
  return n[2] == t[2];
}