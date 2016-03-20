<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="template-div" class="customer-view">
	<button data-backdrop="static" type="button" class="btn btn-success" data-toggle="modal" data-target="#add-cus-modal">
		<i class="fa fa-plus"></i>
	</button>
	
	<div class="row">
		<div class="col-sm-6 content">
			<div>				
				<div class="input-group">				
		            <div class="input-group-btn">
	            		<select style="width: 120px" id="search-customer-select" ng-model="search.type">
						  <option value="all" selected="selected"><spring:message code='customer.search.all' text='All' /></option>
						  <option value="name"><spring:message code='customer.fullname' text='Full name' /></option>
						  <option value="phone"><spring:message code='customer.phone' text='Phone' /></option>
						  <option value="email"><spring:message code='customer.email' text='Email' /></option>
						  <option value="address"><spring:message code='customer.address' text='Address' /></option>
						  <option value="note"><spring:message code='customer.note' text='Note' /></option>
						  <option value="id"><spring:message code='common.id' text='ID' /></option>
						</select>
		            </div>
					<input type="text" class="form-control" placeholder="<spring:message code='customer.search.inputSearch' text='Input search' />" ng-model="search.input">
					<div class="input-group-btn">
		            	<button type="button" ng-click="doSearch()" class="btn btn-success"><span class="glyphicon glyphicon-search"></span></button>
		            </div>
				</div>				
			</div>
		</div> <!-- end class col-sm content -->
	</div> <!-- end class row -->
	
	<div id="list-template-div">
		<table id="list-customer"></table>
		
	</div>
		
	<!-- Modal -->
	<div id="add-cus-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal Add content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"><spring:message code='customer.addNew' text='Add new Customer' /></h4>
	      </div>
	      <div class="modal-body">
	        <table class="table add-customer-table">
	        	<tbody>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.fullname' text='Full name' />: <span style="color: red">*</span></td>
		        		<td><input id="cus-name" data-toggle="tooltip" title="<spring:message code='customer.valid.name' 
		        			text='Name is required' />" ng-model="cus.name" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.phone' text='Phone number' />: <span style="color: red">*</span> </td>
		        		<td><input id="cus-phone" data-toggle="tooltip" title="<spring:message code='customer.valid.phone' 
		        			text='Phone is required' />" ng-model="cus.phone" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.email' text='Email' />:</td>
		        		<td><input id="cus-email" ng-model="cus.email" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.address' text='Address' />: <span style="color: red">*</span> </td>
		        		<td><input id="cus-address" data-toggle="tooltip" title="<spring:message code='customer.valid.address' 
		        			text='Address is required' />" ng-model="cus.address" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.note' text='Note' />: </td>
		        		<td>
		        			<textarea style="width: 100%" ng-model="cus.note" rows="5" id="cus-note"></textarea>
		        		</td>
		        	</tr>
	        	</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	      	<button id="save-customer-btn" type="button" class="btn btn-success" ng-click="save('POST')"><spring:message code='common.save' text='Save' /></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code='common.close' text='Close' /></button>
	      </div>
	    </div> <!-- end modal add content -->
	
	  </div>
	</div>
	
	<!-- Modal Edit -->
	<div id="edit-cus-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"><spring:message code='customer.edit' text='Edit Customer' /></h4>
	      </div>
	      <div class="modal-body">
	        <table class="table edit-customer-table">
	        	<tbody>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.fullname' text='Fullname' />: <span style="color: red">*</span></td>
		        		<td><input id="cus-name-edit" data-toggle="tooltip" title="<spring:message code='customer.valid.name' 
		        			text='Name is required' />" ng-model="edit_cus.name" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.phone' text='Phone number' />: <span style="color: red">*</span> </td>
		        		<td><input id="cus-phone-edit" data-toggle="tooltip" title="<spring:message code='customer.valid.phone' 
		        			text='Phone is required' />" ng-model="edit_cus.phone" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.email' text='Email' />:</td>
		        		<td><input id="cus-email-edit" ng-model="edit_cus.email" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.address' text='Address' />: <span style="color: red">*</span> </td>
		        		<td><input id="cus-address-edit" data-toggle="tooltip" title="<spring:message code='customer.valid.address' 
		        			text='Address is required' />" ng-model="edit_cus.address" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='customer.note' text='Address' />: </td>
		        		<td>
		        			<input hidden id="cus-id-edit" ng-model="edit_cus.id" type="text">
		        			<textarea style="width: 100%" ng-model="edit_cus.note" rows="5" id="cus-note-edit"></textarea>
		        		</td>
		        	</tr>
	        	</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	      	<button id="edit-customer-btn" type="button" class="btn btn-success" ng-click="save('PUT')"><spring:message code='common.save' text='Save' /></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code='common.close' text='Close' /></button>
	      </div>
	    </div> <!-- end modal Edit content -->
	
	  </div>
	</div>
	
	<script type="text/javascript">
		/* Variable for multiple languages in AngularJs controller */
		var customer_get_fail = '<spring:message code="customer.get.fail" text="Fail to load" />';
		var customer_edit_fail = '<spring:message code="customer.edit.fail" text="Fail" />';
		var customer_edit_success = '<spring:message code="customer.edit.success" text="Fail" />';
		var customer_add_success = '<spring:message code="customer.add.success" text="Fail" />';
		var customer_add_fail = '<spring:message code="customer.add.fail" text="Fail" />';
		var common_confirm_delete = '<spring:message code="common.confirm.delete" text="Delete confirm" />';
		var	common_confirm_delete_text = '<spring:message code="common.confirm.delete.text" text="Delete confirm text" />';
		var	common_continue = '<spring:message code="common.continue" text="Continue" />';
		var	common_cancel = '<spring:message code="common.cancel" text="Cancel" />';
		var customer_delete_success = '<spring:message code="customer.delete.success" text="Delete success" />';
		var customer_delete_fail = '<spring:message code="customer.delete.fail" text="Delete fail" />';
		var customer_id = '<spring:message code="customer.id" text="Customer Id" />';
		var customer_action = '<spring:message code="customer.action" text="Action" />';
		var customer_name = '<spring:message code="customer.fullname" text="Name" />';
		var customer_phone = '<spring:message code="customer.phone" text="Phone" />';
		var customer_email = '<spring:message code="customer.email" text="Email" />';
		var customer_address = '<spring:message code="customer.address" text="Addess" />';
		var customer_note = '<spring:message code="customer.note" text="Note" />';
		var common_confirm = '<spring:message code="common.confirm" text="Confirm" />';
	
		$(document).ready(function(){
			
			$('#search-customer-select').select2({
				theme: "bootstrap"
			});

			angular.element($('#template-div')).scope().getListCustomer();
			
		});
	
	</script>
	
</div>