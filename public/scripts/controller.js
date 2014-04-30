angular.module('ArduinoController', [])
.controller('ArduinoControllerCtrl', ['$scope', '$http', '$timeout', function($scope, $http, $timeout) {
  $scope.stats = { brightness: 1, temp: 40 };
  $scope.refreshStats = function(){
    $http.get('/stats')
    .success(function(data){
      $scope.stats = data;
    })
    .error(function(data){
      $scope.stats = { brightness: 'unknown', temp: 'unknown' };
      console.log(data);
    });
  };
  $scope.lightUp = function(color){
    $http.get('/'+color)
    .success(function(data){
      console.log('success');
    })
    .error(function(data){
      console.log('fail');
      console.log(data);
    });
  };
}]);
