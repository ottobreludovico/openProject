var app = angular.module('angularOpenProject');

app.controller("ProjectsCtrl",[ '$scope', '$http', function($scope,$http){
  
  $scope.projects = null;

  $scope.searchProject = function(){
    var title_js = document.getElementById('search').value;
    
    $http({
            method: 'GET',
            url: '/projects.json',
            params: { search: title_js }
          }).then(function (project){
            console.log(project);
            $scope.projects = project.data;
          },function (error){
            alert("Si è verificato un errore!");
    });
    
  };


}]);