<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="template-div" class="admin-view">
	
	<div class="row">
		<div class="col-sm-4 content">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<spring:message code='admin.change.password' text='Change user password' />
				</div>
				
			 	<div class="panel-body">
			 		<div role="form">
					    <div class="form-group">
					      <label for="usr"><spring:message code='admin.field.user' text='Username' />: </label>
					      <input ng-model="user.usr" type="text" class="form-control" id="usr">
					    </div>
					    <div class="form-group">
					      <label for="pwd1"><spring:message code='admin.field.password' text='New password' />: </label>
					      <input ng-model="user.pwd1" type="password" class="form-control" id="pwd1">
					    </div>
					    <div class="form-group">
					      <label for="pwd2"><spring:message code='admin.field.password.confirm' text='Confirm new password' />: </label>
					      <input ng-model="user.pwd2" type="password" class="form-control" id="pwd2">
					    </div>
					    <button ng-click="submitChange()" class="btn btn-success">OK</button>
					 </div>
			 	
			 	</div>
			</div>
		</div> <!-- end class col-sm content -->
	</div> <!-- end class row -->
	
	
	<script type="text/javascript">
		/* Variable for multiple languages in AngularJs controller */
		var lang_valid_username = "<spring:message code='admin.valid.username' text='Username is required' />";
		var lang_valid_pwd = "<spring:message code='admin.valid.pwd' text='Password is required' />";
		var lang_valid_pwd_notmatch = "<spring:message code='admin.valid.pwd.notmatch' text='Two passwords are not match' />";
		var lang_user_not_exist = "<spring:message code='admin.user.not.exist' text='Username does not exist!' />";
		var lang_reset_user_success = "<spring:message code='admin.user.reset.success' text='Reset password successully' />";
		var lang_reset_user_fail = "<spring:message code='admin.user.reset.fail' text='Fail to reset password' />";
	
		$(document).ready(function(){			
			
			animationTransition();
		});
	
	</script>
	
</div>