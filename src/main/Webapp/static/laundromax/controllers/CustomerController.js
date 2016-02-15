mainApp.controller('CustomerController', function($scope, $http, $document) {
   $scope.cus = {};
   var csrf = $('#token').val();
    
   $scope.save = function() {	   
	   if (!$scope.validateAddCus())
		   return null;
	   
	   var data = $scope.cus;
	   $scope.resetInput();
	   $http({
		   method: 'POST',
		   url: 'api/customer',
		   data: data,
		   params: {
			   _csrf: csrf
		   }
	   
	   })
	   .then(function(response){
		  if (response.data.returnStatus == 'SUCCESS') {
			  $('#add-cus-modal').modal("hide");
			  
			  var mess = 'Thêm khách hàng thành công';
			  var type = 'SUCCESS';
			  $scope.showConfirmModal(mess, type);
		  }else {
			  $('#add-cus-modal').modal("hide");
			  
			  var mess = 'Thêm khách hàng thất bại';
			  var type = 'ERROR';
			  $scope.showConfirmModal(mess, type);
		  }
	   }, function(error){
		   alert("The error occurs when saving Customer!!!" + error.statusText);
	   });
   };
   
   $scope.showConfirmModal = function(mess, type) {
	  if (type == 'SUCCESS') {
		  $('#confirm-cus-modal #confirm-content').html(mess);
		  $('#confirm-cus-modal .modal-header').css('background-color', '#5cb85c');
	  }if (type == 'ERROR') {
		  $('#confirm-content').html(mess);
		  $('#confirm-cus-modal .modal-header').css('background-color', 'red');
	  }
	  $('#confirm-cus-modal').modal({backdrop: "static"});
   }
   
   $scope.validateAddCus = function() {
	   var valid = true;
	   $scope.removeHightLight(); // remove validate css
	   $scope.removeValidateTooltip();	// remove tooltip
	   if ($scope.cus.name == null || $scope.cus.name == '') {
		   valid = false;
		   $('#cus-name').tooltip('enable');
		   $('#cus-name').tooltip('show');
		   $scope.fieldHightLight($('#cus-name'));
	   }
	   if ($scope.cus.phone == null || $scope.cus.phone == '' || (!$scope.cus.phone.match(/^\+{0,1}\d{10,12}$/g)) ){
		   valid = false;
		   $('#cus-phone').tooltip('enable');
		   $('#cus-phone').tooltip('show');
		   $scope.fieldHightLight($('#cus-phone'));
	   }
	   if ($scope.cus.address == null || $scope.cus.address == '') {
		   valid = false;
		   $('#cus-address').tooltip('enable');
		   $('#cus-address').tooltip('show');
		   $scope.fieldHightLight($('#cus-address'));
	   }
	   
	   return valid;
   }
   
   $scope.fieldHightLight = function(field) {
		field.css("border", "1px solid red");
		field.css("box-shadow", "0px 0px 6px red");		
   }
   
   $scope.removeHightLight = function() {
		$('#cus-name').css('border', '');
		$('#cus-name').css('box-shadow', '');	

		$('#cus-phone').css('border', '');
		$('#cus-phone').css('box-shadow', '');
		
		$('#cus-address').css('border', '');
		$('#cus-address').css('box-shadow', '');
   }
   
   $scope.removeValidateTooltip = function() {
	   $('#cus-name').tooltip('disable');
	   $('#cus-phone').tooltip('disable');
	   $('#cus-address').tooltip('disable');
   }
   
   $scope.resetInput = function() {
	   $scope.cus = '';
   }
   
   editCustomer = function(cusId) {
	   alert('Da edit' + cusId);
   }
   
   removeCustomer = function(cusId) {
	   $http({
		   method: 'DELETE',
		   url: 'api/customer?cusId=' + cusId,
		   params: {
			   _csrf: csrf
		   }
	   
	   })
	   .then(function(response){
		  if (response.data.returnStatus == 'SUCCESS') {			  
			  var mess = 'Đã xóa khách hàng thành công';
			  var type = 'SUCCESS';
			  $scope.showConfirmModal(mess, type);
		  }else {
			  var mess = 'Có lỗi trong khi xóa khách hàng!';
			  var type = 'ERROR';
			  $scope.showConfirmModal(mess, type);
		  }
		  
		  $('#list-customer').bootstrapTable('refresh', {
			  silent: true
		  });
		  
	   }, function(error){
		   alert("The error occurs when delete Customer!!!" + error.statusText);
	   });
   }
   
   $scope.getListCustomer = function() {	   
		$('#list-customer').bootstrapTable({
			method : 'get',
			url : 'api/customer/list',
			cache : false,
			class : 'table table-hover',
			striped : true,
			pagination : true,
			pageSize : 20,
			pageList : [ 10, 20, 50, 100 ],
			sidePagination : 'server',
			minimumCountColumns : 2,
			clickToSelect : false,
			showRefresh: true,
//			queryParams : {sort: null},
			columns : [ {
				field: 'cId',
				title : 'Mã',
				align : 'center',
				valign : 'middle',
				sortable : true,
				width : '50px'
			}, {
				field : 'name',
				title : 'Tên',
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'phone',
				title : 'Điện thoại',
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'address',
				title : 'Địa chỉ',
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'note',
				title : 'Ghi chú',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'cId',
				title : 'Chức năng',
				align : 'center',
				valign : 'middle',
				sortable : false,
				formatter : featureFormatter
			}]
		
			}).on('load-success.bs.table', function(e, data) {
				console.log(data.status);
		});
	}
   
   function featureFormatter(value, row, index) {
	   return '<span>' +
	   				'<button onclick="editCustomer(' + value + ')" style="margin: 1px 10px" class="btn btn-default">' + 
	   					'<i class="fa fa-lg fa-pencil"></i>' + 
	   				'</button>' +
	   		  '</span>' +  
	   		  '<span>' +
	   		  		'<button onclick="removeCustomer(' + value + ')" class="btn btn-default">' + 
	   		  			'<i class="fa fa-lg fa-trash"></i>' + 
	   		  		'</button>' +
   		  	 '</span>';	   
   }
   
});