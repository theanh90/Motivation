mainApp.controller('InOutController', function($scope, $http, $route, $compile) {
	var csrf = $('#token').val();
	$scope.inout = {};
	
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
   
   reloadPage
	   
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
  
});