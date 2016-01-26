var mainApp = angular.module("mainApp", ['ngRoute']);

mainApp.config(['$routeProvider', function($routeProvider) {
   $routeProvider.
   
   when('/addStudent', {
      templateUrl: 'addStudent', 
      controller: 'AddStudentController'
   }).
   
   when('/viewStudents', {
      templateUrl: 'viewStudents', 
      controller: 'ViewStudentsController'
   });
   
//   otherwise({
//      redirectTo: 'addStudent'
//   });
	
}]);