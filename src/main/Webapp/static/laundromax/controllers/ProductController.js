mainApp.controller('ProductController', function($scope, $http) {
	   $scope.product = {};
	   $scope.edit_product = {};
	   $scope.search = {
			   type: 'all',
			   input: ''
	   };
	   $scope.data = null;
	   var csrf = $('#token').val();
	   
	   $scope.save = function(method) {	   
		   if (!$scope.validateAddProduct(method))
			   return null;
		   
		   var data = method == 'POST' ? $scope.product : $scope.edit_product;
		   
		   $scope.resetInput();
		   $http({
			   method: method,
			   url: 'api/product',
			   data: data,
			   params: {
				   _csrf: csrf
			   }
		   
		   })
		   .then(function(response){
			  var mess = '';
			  $('#add-product-modal').modal("hide");
			  $('#edit-product-modal').modal("hide");
			  
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
			  
			  $('#list-product').bootstrapTable('refresh', {
				  silent: true
			  });
			  
		   }, function(error){
			   alert("The error occurs when Saving/Update Product!!!" + error.statusText);
		   });
	   };
	   
	   $scope.showConfirmModal = function(mess, type) {
		  if (type == 'SUCCESS') {
			  $('#confirm-product-modal #confirm-content').html(mess);
			  $('#confirm-product-modal .modal-header').css('background-color', '#5cb85c');
		  }if (type == 'ERROR') {
			  $('#confirm-content').html(mess);
			  $('#confirm-product-modal .modal-header').css('background-color', 'red');
		  }
		  $('#confirm-product-modal').modal({backdrop: "static"});
	   }
	   
	   $scope.validateAddProduct = function(method) {
		   var valid;
		   var element = {};
		   if (method == 'POST') {
			   element.nameVn = $('#product-name-vn');
			   element.nameEn = $('#product-name-en');
			   element.unit = $('#product-unit');
			   element.laundry = $('#product-laundry');
			   element.dryclean = $('#product-dryclean');
			   element.pressonly = $('#product-pressonly');
		   } else if (method == 'PUT') {
//			   element.name = $('#product-name-edit');
//			   element.phone = $('#product-phone-edit');
//			   element.address = $('#product-address-edit');	   
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
			element.nameVn.css('border', '');
			element.nameVn.css('box-shadow', '');	

			element.nameEn.css('border', '');
			element.nameEn.css('box-shadow', '');
			
			element.unit.css('border', '');
			element.unit.css('box-shadow', '');
			
			element.laundry.css('border', '');
			element.laundry.css('box-shadow', '');	

			element.dryclean.css('border', '');
			element.dryclean.css('box-shadow', '');
			
			element.pressonly.css('border', '');
			element.pressonly.css('box-shadow', '');
	   }
	   
	   $scope.removeValidateTooltip = function(element) {
		   element.nameVn.tooltip('disable');
		   element.nameEn.tooltip('disable');
		   element.unit.tooltip('disable');
		   element.laundry.tooltip('disable');
		   element.dryclean.tooltip('disable');
		   element.pressonly.tooltip('disable');
	   }
	   
	   $scope.displayValidateError = function(element, method) {
		   var valid = true;
		   var check;
		   
		   if (method == 'POST') {
			   check = $scope.product;
		   }else if (method == 'PUT') {
			   check = $scope.edit_product;
		   }
		   
		   if (!check.nameVn) {
			   valid = false;
			   element.nameVn.tooltip('enable');
			   element.nameVn.tooltip('show');
			   $scope.fieldHightLight(element.nameVn);
		   }
		   if (!check.nameEn){
			   valid = false;
			   element.nameEn.tooltip('enable');
			   element.nameEn.tooltip('show');
			   $scope.fieldHightLight(element.nameEn);
		   }
		   if (!check.unit) {
			   valid = false;
			   element.unit.tooltip('enable');
			   element.unit.tooltip('show');
			   $scope.fieldHightLight(element.unit);
		   }
		   if (!check.laundry || (!check.laundry.match(/^\d*$/g))) {
			   valid = false;
			   element.laundry.tooltip('enable');
			   element.laundry.tooltip('show');
			   $scope.fieldHightLight(element.laundry);
		   }
		   if (!check.dryclean || (!check.dryclean.match(/^\d*$/g))) {
			   valid = false;
			   element.dryclean.tooltip('enable');
			   element.dryclean.tooltip('show');
			   $scope.fieldHightLight(element.dryclean);
		   }
		   if (!check.pressonly || (!check.pressonly.match(/^\d*$/g))) {
			   valid = false;
			   element.pressonly.tooltip('enable');
			   element.pressonly.tooltip('show');
			   $scope.fieldHightLight(element.pressonly);
		   }
		   
		   return valid;	   
	   }
	   
	   $scope.resetInput = function() {
		   $scope.product = {};
		   $scope.edit_product = {};
	   }
	   
	   editProduct = function(productId) {
		   $http({
			   method: 'GET',
			   url: 'api/product?productId=' + productId,
			   params: {
				   _csrf: csrf
			   }
		   
		   })
		   .then(function(response){
			  if (response.data.returnStatus == 'SUCCESS') {
				  var data = response.data.data;
				  $scope.edit_product.name = data.name;
				  $scope.edit_product.phone = data.phone;
				  $scope.edit_product.address = data.address;
				  $scope.edit_product.note = data.note;
				  $scope.edit_product.id = data.cId;
				  $('#edit-product-modal').modal({backdrop: "static"});
			  }else {
				  var mess = 'Có lỗi trong khi lấy thông tin khách hàng!';
				  var type = 'ERROR';
			  }
			  
			  $('#list-product').bootstrapTable('refresh', {
				  silent: true
			  });
			  
		   }, function(error){
			   alert("The error occurs when get Product!!!" + error.statusText);
		   });
	   }
	   
	   confirmRemove = function(productId) {
		   
		   BootstrapDialog.show({
			   size: BootstrapDialog.SIZE_SMALL,
	           type: BootstrapDialog.TYPE_WARNING,
	           title: 'Xác nhận xóa',
	           message: 'Bạn có chắc muốn xóa',
	           buttons: [{
	               label: 'Tiếp tục',
	               cssClass: 'btn-success',
	               action: function(dialog) {
	            	   removeProduct(productId, dialog);
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
	   
	   removeProduct = function(productId, dialog) {
		   $http({
			   method: 'DELETE',
			   url: 'api/product?productId=' + productId,
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
			  
			  $('#list-product').bootstrapTable('refresh', {
				  silent: true
			  });
			  
		   }, function(error){
			   alert("The error occurs when delete Product!!!" + error.statusText);
		   });
	   }
	   
	   $scope.doSearch = function() {
		   $('#list-product').bootstrapTable('refresh', {
			   silent: true
		   });
	   }   
	   
	   $scope.getListProduct = function() {
			$('#list-product').bootstrapTable({
				method : 'get',
				url : 'api/product/list',
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
					field: 'vnName',
					title : 'Tên',
					align : 'center',
					valign : 'middle',
					sortable : true,
					width : '50px'
				}, {
					field : 'enName',
					title : 'Tên EN',
					align : 'left',
					valign : 'middle',
					sortable : true
				}, {
					field : 'unit',
					title : 'Đơn vị tính',
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
					field : 'laundry',
					title : 'Giặt nước',
					align : 'left',
					valign : 'right',
					sortable : false
				}, {
					field : 'dryclean',
					title : 'Giặt nước',
					align : 'center',
					valign : 'right',
					sortable : false
				}, {
					field : 'pressonly',
					title : 'Chỉ ủi',
					align : 'center',
					valign : 'right',
					sortable : false
				}]
			
				}).on('load-success.bs.table', function(e, data) {
					$scope.data = data.rows;
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
		   				'<button onclick="editProduct(' + value + ')" style="margin: 1px 10px" class="btn btn-default">' + 
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