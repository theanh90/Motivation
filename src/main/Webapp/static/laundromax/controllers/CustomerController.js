mainApp.controller('CustomerController', function($scope, $http, $document) {
   $scope.cus = {};
   $scope.edit_cus = {};
   $scope.search = {
		   type: 'all',
		   input: ''
   };
   $scope.data = null;
   var csrf = $('#token').val();
   
   $scope.save = function(method) {	   
	   if (!$scope.validateAddCus(method))
		   return null;
	   
	   var data = method == 'POST' ? $scope.cus : $scope.edit_cus;
	   
	   $scope.resetInput();
	   $http({
		   method: method,
		   url: 'api/customer',
		   data: data,
		   params: {
			   _csrf: csrf
		   }
	   
	   })
	   .then(function(response){
		  var mess = '';
		  $('#add-cus-modal').modal("hide");
		  $('#edit-cus-modal').modal("hide");
		  
		  if (response.data.returnStatus == 'SUCCESS') {
			  
			  if (method == 'POST') {
				  mess = 'Thêm khách hàng thành công';
			  } else {
				  mess = 'Sửa thông tin khách hàng thành công';
			  }
			  
			  var type = 'SUCCESS';
			  $scope.showConfirmModal(mess, type);
		  }else {
			  
			  if (method == 'POST') {
				  mess = 'Thêm khách hàng thất bại';
			  } else {
				  mess = 'Sửa thông tin khách hàng thành công';
			  }
			  var type = 'ERROR';
			  $scope.showConfirmModal(mess, type);
		  }
		  
		  $('#list-customer').bootstrapTable('refresh', {
			  silent: true
		  });
		  
	   }, function(error){
		   alert("The error occurs when Saving/Update Customer!!!" + error.statusText);
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
   
   $scope.validateAddCus = function(method) {
	   var valid;
	   var element = {};
	   if (method == 'POST') {
		   element.name = $('#cus-name');
		   element.phone = $('#cus-phone');
		   element.address = $('#cus-address');
	   } else if (method == 'PUT') {
		   element.name = $('#cus-name-edit');
		   element.phone = $('#cus-phone-edit');
		   element.address = $('#cus-address-edit');	   
	   }
	   $scope.removeHightLight(element); // remove validate css
	   $scope.removeValidateTooltip(element);	// remove tooltip
	   valid = $scope.displayValidateError(element, method);	// remove tooltip
	   
	   return valid;
   }
   
   $scope.fieldHightLight = function(field) {
		field.css("border", "1px solid red");
		field.css("box-shadow", "0px 0px 6px red");		
   }
   
   $scope.removeHightLight = function(element) {
		element.name.css('border', '');
		element.name.css('box-shadow', '');	

		element.phone.css('border', '');
		element.phone.css('box-shadow', '');
		
		element.address.css('border', '');
		element.address.css('box-shadow', '');
   }
   
   $scope.removeValidateTooltip = function(element) {
	   element.name.tooltip('disable');
	   element.phone.tooltip('disable');
	   element.address.tooltip('disable');
   }
   
   $scope.displayValidateError = function(element, method) {
	   var valid = true;
	   var check;
	   
	   if (method == 'POST') {
		   check = $scope.cus;
	   }else if (method == 'PUT') {
		   check = $scope.edit_cus;
	   }
	   
	   if (!check.name) {
		   valid = false;
		   element.name.tooltip('enable');
		   element.name.tooltip('show');
		   $scope.fieldHightLight(element.name);
	   }
	   if (!check.phone || (!check.phone.match(/^\+{0,1}\d{10,12}$/g)) ){
		   valid = false;
		   element.phone.tooltip('enable');
		   element.phone.tooltip('show');
		   $scope.fieldHightLight(element.phone);
	   }
	   if (!check.address) {
		   valid = false;
		   element.address.tooltip('enable');
		   element.address.tooltip('show');
		   $scope.fieldHightLight(element.address);
	   }
	   
	   return valid;	   
   }
   
   $scope.resetInput = function() {
	   $scope.cus = {};
	   $scope.edit_cus = {};
   }
   
   editCustomer = function(cusId) {
	   $http({
		   method: 'GET',
		   url: 'api/customer?cusId=' + cusId,
		   params: {
			   _csrf: csrf
		   }
	   
	   })
	   .then(function(response){
		  if (response.data.returnStatus == 'SUCCESS') {
			  var data = response.data.data;
			  $scope.edit_cus.name = data.name;
			  $scope.edit_cus.phone = data.phone;
			  $scope.edit_cus.address = data.address;
			  $scope.edit_cus.note = data.note;
			  $scope.edit_cus.id = data.cId;
			  $('#edit-cus-modal').modal({backdrop: "static"});
//			  $scope.showConfirmModal(mess, type);
		  }else {
			  var mess = 'Có lỗi trong khi lấy thông tin khách hàng!';
			  var type = 'ERROR';
//			  $scope.showConfirmModal(mess, type);
		  }
		  
		  $('#list-customer').bootstrapTable('refresh', {
			  silent: true
		  });
		  
	   }, function(error){
		   alert("The error occurs when get Customer!!!" + error.statusText);
	   });
   }
   
   confirmRemove = function(cusId) {
//	   $('#confirm-delete-cus-modal').modal({backdrop: "static"});
	   
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: 'Xác nhận xóa',
           message: 'Bạn có chắc muốn xóa',
           buttons: [{
               label: 'Tiếp tục',
               cssClass: 'btn-success',
               action: function(dialog) {
            	   removeCustomer(cusId, dialog);
               }
           }, {
               label: 'Hủy',
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	   

   }
   
   removeCustomer = function(cusId, dialog) {
	   $http({
		   method: 'DELETE',
		   url: 'api/customer?cusId=' + cusId,
		   params: {
			   _csrf: csrf
		   }   
	   }).then(function(response){
		  dialog.close();
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
   
   $scope.doSearch = function() {
	   $('#list-customer').bootstrapTable('refresh', {
		   silent: true
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
			queryParams : queryParams,
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
				$scope.data = data.rows;
				console.log(data.status);
		});
	}
   
   function queryParams(params) {	   
	   $scope.search.type = !$scope.search.type ? "" : $scope.search.type;
	   $scope.search.input = !$scope.search.input ? "" : $scope.search.input;
	   
	   params.typeSearch = $scope.search.type;
	   params.textSearch = $scope.search.input;
	   
	   return params;
   }
   
   function featureFormatter(value, row, index) {
	   var temp = '<span>' +
	   				'<button onclick="editCustomer(' + value + ')" style="margin: 1px 10px" class="btn btn-default">' + 
	   					'<i class="fa fa-lg fa-pencil"></i>' + 
	   				'</button>' +
	   		  '</span>' +  
	   		  '<span>' +
	   		  		'<button onclick="confirmRemove(' + value + ')" class="btn btn-default">' + 
	   		  			'<i class="fa fa-lg fa-trash"></i>' + 
	   		  		'</button>' +
   		  	 '</span>';
	   
	   return temp;
   }
   
});