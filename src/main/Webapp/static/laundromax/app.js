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
   }).
   
   when('/invoice/addinvoice', {
      templateUrl: 'invoice/addinvoice', 
      controller: 'AddInvoiceController'
   }).
   
   when('/invoice/viewinvoice/:id', {
      templateUrl: 'invoice/viewinvoice', 
      controller: 'ViewInvoiceController'
   }).
   
   when('/inout', {
      templateUrl: 'inout', 
      controller: 'InOutMoneyController'
   }).
   
   when('/admin', {
      templateUrl: 'admin', 
      controller: 'AdminController'
   });
   
//   otherwise({
//      redirectTo: 'addStudent'
//   });
	
}]);