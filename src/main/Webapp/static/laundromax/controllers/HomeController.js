mainApp.controller('HomeController', function($scope, $http, $route, $compile) {
	var csrf = $('#token').val();
	
	$scope.total = {};
	$scope.inout = {};
	$scope.money_left = 0;
	
	$scope.loadReportDate = function() {		
		$http({
			method: 'GET',
			url: 'api/home/report?start=' + select_start + '&&end=' + select_end 		   
		})
		.then(function(response){
	   		if (response.data.returnStatus == 'SUCCESS') {
	   			// update money scope
	   			$scope.total.invoice = response.data.data[0] ? response.data.data[0] : 0;
	   			$scope.total.price = response.data.data[1] ? response.data.data[1] : 0;
	   			$scope.total.pay = response.data.data[2] ? response.data.data[2] : 0;
	   			$scope.total.due = response.data.data[3] ? response.data.data[3] : 0;
	   			
	   			// render report
	   			$('#total-invoice').html(changeNumberFormat($scope.total.invoice) + ' ' + lang_invoice);
	   			$('#total-price').html(changeNumberFormat($scope.total.price)  + ' VND');
	   			$('#total-pay').html(changeNumberFormat($scope.total.pay)  + ' VND');
	   			$('#total-due').html(changeNumberFormat($scope.total.due)  + ' VND');
	   		} else {
	   			alert("The error occurs when get report details!!!");
	   		}
	   		
	   		// continue to get Money in/out report
	   		$scope.loadInOutReport();
		  			  
		}, function(error){
			alert("The error occurs when get report details!!!" + error.statusText);
		});
	}
	
	$scope.loadInOutReport = function() {		
		$http({
			method: 'GET',
			url: 'api/home/inoutreport?start=' + select_start + '&&end=' + select_end 		   
		})
		.then(function(response){
	   		if (response.data.returnStatus == 'SUCCESS') {
	   			$scope.inout.put = response.data.data[0] ? response.data.data[0] : 0;
	   			$scope.inout.withdraw = response.data.data[1] ? response.data.data[1] : 0;
	   			
	   			$('#total-put').html(changeNumberFormat($scope.inout.put)  + ' VND');
	   			$('#total-withdraw').html(changeNumberFormat($scope.inout.withdraw)  + ' VND');	   			
	   		} else {
	   			alert("The error occurs when get report details!!!");
	   		}
		  			  
		}, function(error){
			alert("The error occurs when get report details!!!" + error.statusText);
		});
	}
	
	$scope.loadLeftMoney = function() {		
		$http({
			method: 'GET',
			url: 'api/home/leftmoney'		   
		})
		.then(function(response){
	   		if (response.data.returnStatus == 'SUCCESS') {
	   			$scope.money_left = response.data.data ? response.data.data : 0;
	   			
	   			var money_left_render;
	   			if ($scope.money_left >= 0) {
	   				money_left_render = changeNumberFormat($scope.money_left);
	   			} else {
	   				money_left_render = '-' + changeNumberFormat(-$scope.money_left);
	   			}
	   			
	   			$('#total-money').html(money_left_render  + ' VND');	   			
	   		} else {
	   			alert("The error occurs when get report details!!!");
	   		}
		  			  
		}, function(error){
			alert("The error occurs when get report details!!!" + error.statusText);
		});
	}
	   
	$scope.controllerReady = function() {
		$scope.loadLeftMoney();
	}
	
});