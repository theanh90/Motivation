mainApp.controller('AdminController', function($scope, $http, $document) {
	var csrf = $('#token').val();
	var is_admin = $('#is-admin').val();
	
	$scope.user = {};
   
	$scope.submitChange = function() {
		if (!$scope.validateUP())
			return;
		
		$http({
			   method: 'POST',
			   url: 'api/admin/resetpwd',
			   data: $scope.user,
			   params: {
				   _csrf: csrf
			   }
		   
		   })
		   .then(function(response){
			   if (response.data.returnStatus == 'SUCCESS') {
				   if (response.data.data == 0) {
					   var mess = lang_user_not_exist;
					   type = 'ERROR';
					   showConfirmModal(mess, type);
				   } else {
					   var mess = lang_reset_user_success;
					   type = 'SUCCESS';
					   showConfirmModal(mess, type, reloadPage);
				   }
			   } else {
				   alert(lang_reset_user_fail);
			   }
			  
		   }, function(error){
			   alert(lang_reset_user_fail);
		   });
	}
	
	$scope.validateUP = function() {
		var result = true;
		
		if (!$scope.user.usr) {
			showElementValidate($('#usr'), lang_valid_username);
			result = false;
		}
		if (!$scope.user.pwd1) {
			showElementValidate($('#pwd1'), lang_valid_pwd);
			result = false;
		}
		if ($scope.user.pwd1 && $scope.user.pwd1 != $scope.user.pwd2) {
			showElementValidate($('#pwd2'), lang_valid_pwd_notmatch);
			result = false;
		}
		
		return result;
	}
	
});