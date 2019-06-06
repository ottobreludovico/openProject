var app = angular.module('angularOpenProject');

app.controller("ProjectsCtrl",[ '$scope', '$http', function($scope,$http){
  
  $scope.projects = null;
  var my_user = null;

  function getUser(index,id){
    $http({

          method: 'GET',
          url: '/users/'+id+'.json'

        }).then(function (user){
          
          $scope.projects[index]['first_name'] = user.data.first_name;
          $scope.projects[index]['last_name'] = user.data.last_name;
          //console.log(user.data);           

        },function (error){

          alert("Si è verificato un errore!");
    });
  }

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


}]);