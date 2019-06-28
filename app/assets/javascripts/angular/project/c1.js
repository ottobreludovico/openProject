var app = angular.module('angularOpenProject',['dndLists']);

app.controller("c1", ["$http", "$scope" , function($http, $scope){
	
  function editState(item,new_state){
		var data= {
      "user_story": {
        "state": new_state
      }
		}
		$http.put('/user_stories/' + item.id, data);
  }


  $scope.title ="drag and drop"

  $scope.lists = [ {id: 1, name: "TODO", cards: []},
  {id: 2, name: "DOING",  cards: []},
  {id: 3, name: "DONE", cards: []}]

  var currentProject=1;

	$http({
		method: 'GET',
		url: '/projects/1.json'
	}).then(function(stories){

		for( var i = 0; i < stories.data.length; i ++ ){
        if(stories.data[i].state==0){
				 $scope.lists[0].cards.push(stories.data[i]);
			  }else if(stories.data[i].state==1){
				 $scope.lists[1].cards.push(stories.data[i]);
			  }else{
				 $scope.lists[2].cards.push(stories.data[i]);
			  }
    }

	}, function(error){

		console.log(error);

	});  
   
   $scope.dropCallbackItems = function(index, item, external, ind){
     console.log(index, item, external, ind)
   }
   
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
    
  
}]);