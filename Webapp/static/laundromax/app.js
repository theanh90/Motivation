var mainApp = angular.module("mainApp", ['ngRoute']);

mainApp.config(['$routeProvider', function($routeProvider) {
   $routeProvider.
   
   when('/home', {
      templateUrl: 'home', 
      controller: 'HomeController'
   }).
   
   when('/customer', {
	  templateUrl: 'customer', 
      controller: 'CustomerController'
   }).
   
   when('/product', {
      templateUrl: 'product', 
      controller: 'ProductController'
   }).
   
   when('/invoice', {
      templateUrl: 'invoice', 
      controller: 'InvoiceController'
   });
   
//   otherwise({
//      redirectTo: 'addStudent'
//   });
	
}]);