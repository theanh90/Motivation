mainApp.controller('ViewInvoiceController', function($scope, $http, $route) {
	$scope.invoice_id = $route.current.params.id;
	
	$scope.getInvoice = function() {
		$http({
			   method: 'GET',
			   url: 'api/invoice/getbyid?id=' + $scope.invoice_id
		   
		   })
		   .then(function(response){
			  if (response.data.returnStatus == 'SUCCESS') {
				  console.log(response);
			  }else {
				  var mess = lang_get_fail;
				  var type = 'ERROR';
				  showConfirmModal(mess, type);				  
			  }
			  			  
		   }, function(error){
			   alert("The error occurs when get Invoice details!!!" + error.statusText);
		   });
	}
	
	// call function on loaded
	$scope.getInvoice();
});