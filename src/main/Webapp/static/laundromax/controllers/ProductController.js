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
					  mess = lang_add_success;
				  } else {
					  mess = lang_edit_success;
				  }
				  
				  var type = 'SUCCESS';
				  $scope.showConfirmModal(mess, type);
			  }else {
				  
				  if (method == 'POST') {
					  mess = lang_add_fail;
				  } else {
					  mess = lang_edit_fail;
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
		   dialog_type = null;
			  
		   if (type == 'SUCCESS') {
			   dialog_type = BootstrapDialog.TYPE_SUCCESS;
		   }if (type == 'ERROR') {
			   dialog_type = BootstrapDialog.TYPE_DANGER;
		   }
		   
		   BootstrapDialog.show({
			   size: BootstrapDialog.SIZE_SMALL,
	           type: dialog_type,
	           title: common_confirm,
	           message: mess,
	           buttons: [{
	               label: "OK",
	               cssClass: 'btn-success',
	               action: function(dialog) {
	                   dialog.close();
	               }
	           }]
	       }); 
	   }
	   
	   $scope.validateAddProduct = function(method) {
		   var valid;
		   var element = {};
		   if (method == 'POST') {
			   element.nameVn = $('#product-name-vn');
//			   element.nameEn = $('#product-name-en');
			   element.unit = $('#product-unit');
			   element.laundry = $('#product-laundry');
			   element.dryclean = $('#product-dryclean');
			   element.pressonly = $('#product-pressonly');
		   } else if (method == 'PUT') {
			   element.nameVn = $('#product-name-vn-edit');
//			   element.nameEn = $('#product-name-en-edit');
			   element.unit = $('#product-unit-edit');
			   element.laundry = $('#product-laundry-edit');
			   element.dryclean = $('#product-dryclean-edit');
			   element.pressonly = $('#product-pressonly-edit');   
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

//			element.nameEn.css('border', '');
//			element.nameEn.css('box-shadow', '');
			
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
//		   element.nameEn.tooltip('disable');
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
//		   if (!check.nameEn){
//			   valid = false;
//			   element.nameEn.tooltip('enable');
//			   element.nameEn.tooltip('show');
//			   $scope.fieldHightLight(element.nameEn);
//		   }
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
			   url: 'api/product?pid=' + productId,
			   params: {
				   _csrf: csrf
			   }
		   
		   })
		   .then(function(response){
			  if (response.data.returnStatus == 'SUCCESS') {
				  var data = response.data.data;
				  $scope.edit_product.nameVn = data.vnName;
				  $scope.edit_product.nameEn = data.enName;				  
				  $scope.edit_product.unit = data.unit;
				  $scope.edit_product.laundry = data.laundry.toString();				  
				  $scope.edit_product.dryclean = data.dryclean.toString();
				  $scope.edit_product.pressonly = data.pressonly.toString();				  
				  $scope.edit_product.note = data.note;
				  $scope.edit_product.id = data.pid;
				  $('#edit-product-modal').modal({backdrop: "static"});
			  }else {
				  var mess = lang_get_fail;
				  var type = 'ERROR';
				  showConfirmModal(mess, type);
				  
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
	           title: lang_confirm_delete,
	           message: lang_confirm_delete_text,
	           buttons: [{
	               label: lang_continue,
	               cssClass: 'btn-success',
	               action: function(dialog) {
	            	   removeProduct(productId, dialog);
	               }
	           }, {
	               label: lang_cancel,
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
			   url: 'api/product?pid=' + productId,
			   params: {
				   _csrf: csrf
			   }   
		   }).then(function(response){
			  dialog.close();
			  if (response.data.returnStatus == 'SUCCESS') {			  
				  var mess = lang_delete_success;
				  var type = 'SUCCESS';
				  $scope.showConfirmModal(mess, type);
			  }else {
				  var mess = lang_delete_fail;
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
				sortName: 'pid',
				sortOrder: 'desc',
				pageSize : 20,
				pageList : [ 10, 20, 50, 100 ],
				sidePagination : 'server',
				minimumCountColumns : 2,
				clickToSelect : false,
				showRefresh: true,
				queryParams : queryParams,
				columns : [ {
					field: 'pid',
					title : '#',
					align : 'center',
					valign : 'center',
					sortable : true,
					width : '50px'
				},{
					field: 'vnName',
					title : lang_vnName,
					align : 'left',
					valign : 'middle',
					sortable : true
				}, {
					field : 'enName',
					title : lang_enName,
					align : 'left',
					valign : 'middle',
					sortable : true
				}, {
					field : 'unit',
					title : lang_unit,
					align : 'left',
					valign : 'middle',
					sortable : true
				}, {
					field : 'note',
					title : lang_note,
					align : 'left',
					valign : 'middle',
					sortable : false			
				}, {
					field : 'laundry',
					title : lang_laundry,
					align : 'right',
					valign : 'middle',
					sortable : false
				}, {
					field : 'dryclean',
					title : lang_dryclean,
					align : 'right',
					valign : 'middle',
					sortable : false
				}, {
					field : 'pressonly',
					title : lang_pressonly,
					align : 'right',
					valign : 'middle',
					sortable : false
				}, {
					title : lang_action,
					align : 'center',
					valign : 'middle',
					sortable : false,
					formatter: featureFormatter
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
		   				'<button onclick="editProduct(' + row.pid + ')" style="margin: 1px 10px" class="btn btn-default">' + 
		   					'<i class="fa fa-lg fa-pencil"></i>' + 
		   				'</button>' +
		   		  '</span>' +  
		   		  '<span>' +
		   		  		'<button onclick="confirmRemove(' + row.pid + ')" class="btn btn-default">' + 
		   		  			'<i class="fa fa-lg fa-trash"></i>' + 
		   		  		'</button>' +
	   		  	 '</span>';
		   
		   return temp;
	   }
	 
	
});