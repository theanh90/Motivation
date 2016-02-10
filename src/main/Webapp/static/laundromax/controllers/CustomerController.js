mainApp.controller('CustomerController', function($scope, $http) {
   $scope.message = "New customer here";
   $scope.cus = {};
   var csrf = $('#token').val();
   
   $scope.save = function() {
	   var data = $scope.cus;
	   
	   $http({
		   method: 'POST',
		   url: 'api/customer',
		   data: data,
		   params: {
			   _csrf: csrf
		   }
	   
	   })
	   .then(function(response){
		   console.log(response.data);
	   });
   };
});