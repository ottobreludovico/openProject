var app = angular.module('angularOpenProject');

app.controller("ProjectsCtrl",[ '$scope', '$http', function($scope,$http){
  
  $scope.projects = null;
  var my_user = null;

  /* get user */

  function getUser(index,id){
    $http({

          method: 'GET',
          url: '/users/'+id+'.json'

        }).then(function (user){
          
          $scope.projects[index]['first_name'] = user.data.first_name;
          $scope.projects[index]['last_name'] = user.data.last_name;
          $scope.projects[index]['reviews'] = Math.round(Math.random()*5);
          //console.log(user.data);           

        },function (error){

          alert("Si è verificato un errore!");
    });
  }

  /* end get user s*/

  /* search projects */

  $scope.searchProject = function(){
    
    var title_js = document.getElementById('search').value;
    
    $http({

            method: 'GET',
            url: '/projects.json',
            params: { search: title_js }

          }).then(function (project){
             
            $scope.projects = project.data; 
            
            for( var i = 0; i < $scope.projects.length; i ++ ){
              getUser(i,$scope.projects[i].teamleader_id);
            }

          },function (error){

            alert("Si è verificato un errore!");
    });
    
  };

  /* end search projects */

  /* order projects */  

  $scope.sortProject = function(obj,value){

    if( obj.id == 0 ){
      function compare(a,b){
        if( a[value] > b[value] ) return -1;
        else if( a[value] < b[value] ) return 1;
        else return 0;
      }
      $scope.projects.sort(compare);
      obj.id = 1;
    }
    else{
      function compare(a,b){
        if( a[value] < b[value] ) return -1;
        else if( a[value] > b[value] ) return 1;
        else return 0;
      }
      $scope.projects.sort(compare);
      obj.id = 0;
    }

  };

  /* end order projects */


}]);