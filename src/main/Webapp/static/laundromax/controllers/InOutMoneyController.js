mainApp.controller('InOutMoneyController', function($scope, $http, $route, $compile) {
	var csrf = $('#token').val();
	$scope.inout = {};
    $scope.search = {
	   type: 'all',
	   input: ''
    };
	
	$scope.saveInOut = function() {
		
		$scope.inout.dateCreate = (moment($('#inout-date').val(), "DD/MM/YYYY HH:mm").unix()) * 1000;
		console.log($scope.inout);	   
		
		if (!$scope.validateInOut()) {
			return null;
		}
		
		var content = '';
		var type_converted;
		if ($scope.inout.type == 'put') {
			type_converted = lang_announ_type_put;
		} else {
			type_converted = lang_announ_type_withdraw;
		}
		
		content += '<div class="bootstrap-table">' +
						'<table class="table table-hover table-striped">' +
							'<tr><td class="c-bold">' + lang_announ_type + '</td><td>' + type_converted + '</td></tr>' +
							'<tr><td class="c-bold">' + lang_announ_date + '</td><td>' + $('#inout-date').val() + '</td></tr>' +
							'<tr><td class="c-bold">' + lang_announ_who + '</td><td>' + $scope.inout.who + '</td></tr>' +
							'<tr><td class="c-bold">' + lang_announ_money + '</td><td>' + changeNumberFormat($scope.inout.money) + ' VND </td></tr>' +
							'<tr><td class="c-bold">' + lang_announ_reason + '</td><td>' + $scope.inout.reason + '</td></tr>' +
						'</table>' +
					'</div>';
		
		$scope.confirmRemove(content);
		
	}
	   
   confirmRemove = function(id) {
	   var message = common_confirm_delete_text;
	   message += '</br></br><div>' + lang_input_whoCancel + ': <input id="who-cancel-input" type="text" /></div></br> <div id="who-validate" style="color: red" hidden>' +
	   					lang_input_whoCancel_validate + '</div>';
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: common_confirm_delete,
           message: message,
           buttons: [{
               label: common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
            	   removeInOutMoney(id, dialog);
               }
           }, {
	           label: common_cancel,
	           cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	   

   }
   
   removeInOutMoney = function(id, dialog) {
	   var whoCancel = $('#who-cancel-input').val();
	   if (!whoCancel) {
		   $('#who-validate').show();
		   return;
	   }
	   
	   $http({
		   method: 'DELETE',
		   url: 'api/inout?' + $.param({"id": id, "whoCancel" : whoCancel}),
		   params: {
			   _csrf: csrf
		   }   
	   }).then(function(response){
		  dialog.close();
		  if (response.data.returnStatus == 'SUCCESS') {			  
			  var mess = lang_inout_delete_success;
			  var type = 'SUCCESS';
			  showConfirmModal(mess, type);
		  }else {
			  var mess = lang_inout_delete_fail;
			  var type = 'ERROR';
			  showConfirmModal(mess, type);
		  }
		  
		  $('#list-inout-money').bootstrapTable('refresh', {
			  silent: true
		  });
		  
	   }, function(error){
		   dialog.close();
		   alert("The error occurs when delete Customer!!!" + error.statusText);
	   });
   }
	   
   $scope.confirmRemove = function(message) { 
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_NORMAL,
           type: BootstrapDialog.TYPE_PRIMARY,
           title: common_confirm,
           message: message,
           buttons: [{
               label: common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
            	   $scope.doSave(dialog);
               }
           }, {
               label: common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	   

   }
   
   $scope.doSave = function(dialog) {
		$http({
		   method: 'POST',
		   url: 'api/inout',
		   data: $scope.inout,
		   params: {
			   _csrf: csrf
		   }
	   
	   }).then(function(response){
		   dialog.close();
		   if (response.data.returnStatus == 'SUCCESS') {				  
			  var mess = lang_save_success;
			  var type = 'SUCCESS';
			  showConfirmModal(mess, type, reloadPage);
		   } else {
			  var mess = lang_save_fail;
			  var type = 'ERROR';
			  showConfirmModal(mess, type, reloadPage);
		   }
		   
	   }, function(error){
		   alert("The error occurs when Save in/out !!!" + error.statusText);
	   });
   }
	   
   $scope.validateInOut = function() {
	   var valid;
	   var element = {};
	   element.dateCreate = $('#inout-date');
	   element.who = $('#inout-who');
	   element.money = $('#inout-money');
	   element.reason = $('#inout-reason');
	   element.type = $('#inout-type-div');
	   
	   $scope.removeHightLight(element); // remove validate css
	   $scope.removeValidateTooltip(element);	// remove tooltip
	   valid = $scope.displayValidateError(element);	// display tooltip
	   
	   return valid;
   }
   
   $scope.removeHightLight = function(element) {
		element.dateCreate.css('border', '');
		element.dateCreate.css('box-shadow', '');	

		element.who.css('border', '');
		element.who.css('box-shadow', '');
		
		element.money.css('border', '');
		element.money.css('box-shadow', '');
		
		element.reason.css('border', '');
		element.reason.css('box-shadow', '');
		
		element.type.css('border', '');
		element.type.css('box-shadow', '');
  }
  
  $scope.removeValidateTooltip = function(element) {
	   element.dateCreate.tooltip('disable');
	   element.who.tooltip('disable');
	   element.money.tooltip('disable');
	   element.reason.tooltip('disable');
	   element.type.tooltip('disable');
  }
  
  $scope.displayValidateError = function(element) {
	   var valid = true;
	   var check = $scope.inout;
	   
	   if (!check.dateCreate) {
		   valid = false;
		   element.dateCreate.tooltip('enable');
		   element.dateCreate.tooltip('show');
		   $scope.fieldHightLight(element.dateCreate);
	   }
	   if (!check.who){
		   valid = false;
		   element.who.tooltip('enable');
		   element.who.tooltip('show');
		   $scope.fieldHightLight(element.who);
	   }
	   if (!check.money || check.money <= 0 ) {
		   valid = false;
		   element.money.tooltip('enable');
		   element.money.tooltip('show');
		   $scope.fieldHightLight(element.money);
		   element.money.val('');
	   }
	   if (!check.reason) {
		   valid = false;
		   element.reason.tooltip('enable');
		   element.reason.tooltip('show');
		   $scope.fieldHightLight(element.reason);
	   }
	   if (!check.type) {
		   valid = false;
		   element.type.tooltip('enable');
		   element.type.tooltip('show');
		   $scope.fieldHightLight(element.type);
	   }
	   
	   return valid;	   
  }
  
  $scope.fieldHightLight = function(field) {
		field.css("border", "1px solid red");
		field.css("box-shadow", "0px 0px 6px red");		
  }   
  
  $scope.getListInOutMoney = function() {
		$('#list-inout-money').bootstrapTable({
			method : 'get',
			url : 'api/inout/list',
			cache : false,
			class : 'table table-hover',
			striped : true,
			pagination : true,
			sortName: 'dateCreate',
			sortOrder: 'desc',
			pageSize : 20,
			pageList : [ 10, 20, 50, 100 ],
			sidePagination : 'server',
			minimumCountColumns : 2,
			clickToSelect : false,
			showRefresh: true,
			queryParams : queryParams,
			rowAttributes: inOutMoneyRowStyle,
			columns : [ {
				field: 'type',
				title : lang_announ_type,
				align : 'left',
				valign : 'middle',
				sortable : true,
				formatter: typeFormatter
			}, {
				field : 'dateCreate',
				title : lang_announ_date,
				align : 'left',
				valign : 'middle',
				sortable : true,
				formatter: dateFormatter
			}, {
				field : 'who',
				title : lang_announ_who,
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'money',
				title : lang_announ_money,
				align : 'right',
				valign : 'middle',
				sortable : true,
				formatter : moneyFormatter		
			}, {
				field : 'reason',
				title : lang_announ_reason,
				align : 'left',
				valign : 'middle'
			}, {
				field : 'dateCancel',
				title : lang_announ_datecancel,
				align : 'right',
				valign : 'middle',
				sortable : false,
				formatter: dateFormatter
			}, {
				field : 'whoCancel',
				title : lang_announ_whocancel,
				align : 'right',
				valign : 'middle',
				sortable : false
			}, {
				field : "",
				title : lang_customer_action,
				align : 'center',
				valign : 'middle',
				sortable : false,
				formatter : featureFormatter
			}]
		
			}).on('load-success.bs.table', function(e, data) {
				$scope.data = data.rows;
		});
	}
  	
  	$scope.doSearch = function() {
	   $('#list-inout-money').bootstrapTable('refresh', {
		   silent: true
	   });
  	} 
	
	$scope.searchInOutChange = function() {
		if ($scope.search.type == 'type') {
			$scope.search.input = 0;
			$('#inout-search-input').hide();
			$('#inout-type-search-div').show();
		} else {
			$scope.search.input = '';
			$('#inout-search-input').show();
			$('#inout-type-search-div').hide();
		}
	}
	
	function inOutMoneyRowStyle(row, index) {
		if (row.active == 0) {
			return {
				style: "background-color: rgb(251, 178, 173) !important"
			};
		}
		
	}
	   
   function featureFormatter(value, row, index) {
	   if (row.active == 0)
		   return lang_cancelled;
	   
	   var temp =  	'<span>' +
			   		  		'<button onclick="confirmRemove(' + row.mid + ')" class="btn btn-default">' + 
			   		  			'<i class="fa fa-lg fa-trash"></i>' + 
			   		  		'</button>' +
		   		  	 '</span>';	   
	   return temp;
   }
  
  function typeFormatter(value, row, index) {
	   if (value == 0) {
		   return lang_announ_type_withdraw;
	   } else {
		   return lang_announ_type_put;
	   }
  }
  
  function dateFormatter(value, row, index) {
	  if (value) {
		  return moment(value).format("DD/MM/YYYY - HH:mm");		  
	  }
  }
  
  function queryParams(params) {	   
	   $scope.search.type = !$scope.search.type ? "" : $scope.search.type;
	   $scope.search.input = ($scope.search.input == null || $scope.search.input == undefined) ? "" : $scope.search.input;
	   
	   params.typeSearch = $scope.search.type;
	   params.textSearch = $scope.search.input;
	   
	   return params;
  }
  
  function moneyFormatter(value, row, index) {
	  if (row.type == 0) {
		  return '- ' + changeNumberFormat(value);
	  }
	  return changeNumberFormat(value);
  }
  
});