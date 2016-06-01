<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="template-div" class="product-view">
	<button data-backdrop="static" type="button" class="btn btn-success" data-toggle="modal" data-target="#add-product-modal">
		<i class="fa fa-plus"></i>
	</button>
	
	<div class="row">
		<div class="col-sm-6 content">
			<div>				
				<div class="input-group">				
		            <div class="input-group-btn">
	            		<select style="width: 120px" id="search-product-select" ng-model="search.type">
	            		  <option value="all" selected="selected"><spring:message code='customer.search.all' text='All' /></option>
						  <option value="vnName"><spring:message code='product.vnName' text='VN Name' /></option>
						  <option value="enName"><spring:message code='product.enName' text='EN Name' /></option>
						  <option value="note"><spring:message code='product.note' text='Note' /></option>
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
		<table id="list-product"></table>
		
	</div>
	
	<!-- Modal -->
	<div id="add-product-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal Add content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"><spring:message code='product.addNew' text='Add New Product' /></h4>
	      </div>
	      <div class="modal-body">
	        <table class="table add-product-table">
	        	<tbody>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.vnName' text='VN Name' />: <span style="color: red">*</span></td>
		        		<td><input id="product-name-vn" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.vnName' text='VN Name is required' />" 
		        			ng-model="product.nameVn" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.enName' text='EN Name' />: <!-- <span style="color: red">*</span> --></td>
		        		<td><input id="product-name-en" <%-- data-toggle="tooltip" title="<spring:message code='product.valid.enName' text='EN Name is required' />" --%> 
	        				ng-model="product.nameEn" type="text">
        				</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.unit' text='Unit' />: <span style="color: red">*</span> </td>
		        		<td><input id="product-unit" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.unit' text='Unit is required' />" 
		        			ng-model="product.unit" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.laundryPrice' text='Laundry' />: <span style="color: red">*</span></td>
		        		<td><input id="product-laundry" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.laundry' text='Laundry price is required' />" 
		        			ng-model="product.laundry" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.drycleanPrice' text='Dryclean' />: <span style="color: red">*</span></td>
		        		<td><input id="product-dryclean" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.dryclean' text='Dryclean price is required' />" 
		        			ng-model="product.dryclean" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.pressOnlyPrice' text='PressOnly' />: </td>
		        		<td><input id="product-pressonly" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.pressonly' text='Pressonly price is required' />" 
		        			ng-model="product.pressonly" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.note' text='Note' />: </td>
		        		<td>
		        			<textarea style="width: 100%" ng-model="product.note" rows="5" id="product-note"></textarea>
		        		</td>
		        	</tr>
	        	</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	      	<button id="save-product-btn" type="button" class="btn btn-success" ng-click="save('POST')"><spring:message code='common.save' text='Save' /></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code='common.close' text='Close' /></button>
	      </div>
	    </div> <!-- end modal add content -->
	
	  </div>
	</div>
	
	<!-- Modal Edit -->
	<div id="edit-product-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"><spring:message code='product.edit' text='Edit Product' /></h4>
	      </div>
	      <div class="modal-body">
	        <table class="table edit-product-table">
	        	<tbody>
	        		<tr>
		        		<td class="text-field"><spring:message code='product.vnName' text='VN Name' />: <span style="color: red">*</span></td>
		        		<td><input id="product-name-vn-edit" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.vnName' text='VN Name is required' />" 
		        			ng-model="edit_product.nameVn" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.enName' text='EN Name' />: <!-- <span style="color: red">*</span> --></td>
		        		<td><input id="product-name-en-edit" <%-- data-toggle="tooltip" title="<spring:message code='product.valid.enName' text='EN Name is required' />" --%> 
		        			ng-model="edit_product.nameEn" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.unit' text='Unit' />: <span style="color: red">*</span> </td>
		        		<td><input id="product-unit-edit" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.unit' text='Unit is required' />" 
		        			ng-model="edit_product.unit" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.laundryPrice' text='Laundry' />: <span style="color: red">*</span></td>
		        		<td><input id="product-laundry-edit" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.laundry' text='Laundry price is required' />" 
		        			ng-model="edit_product.laundry" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.drycleanPrice' text='Dryclean' />: <span style="color: red">*</span></td>
		        		<td><input id="product-dryclean-edit" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.dryclean' text='Dryclean price is required' />" 
		        			ng-model="edit_product.dryclean" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.pressOnlyPrice' text='PressOnly' />:</td>
		        		<td><input id="product-pressonly-edit" data-toggle="tooltip" 
		        			title="<spring:message code='product.valid.pressonly' text='Pressonly price is required' />" 
		        			ng-model="edit_product.pressonly" type="text">
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.note' text='Note' />: </td>
		        		<td>
		        			<textarea style="width: 100%" ng-model="edit_product.note" rows="5" id="product-note-edit"></textarea>
		        		</td>
		        	</tr>
	        	
	        	</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	      	<button id="save-product-btn" type="button" class="btn btn-success" ng-click="save('PUT')"><spring:message code='common.save' text='Save' /></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code='common.close' text='Close' /></button>
	      </div>
	    </div> <!-- end modal Edit content -->
	
	  </div>
	</div>
	
	<script type="text/javascript">
		// multiple language variable
		var lang_vnName = '<spring:message code="product.vnName" text="VN Name" />';
		var lang_enName = '<spring:message code="product.enName" text="EN Name" />';
		var lang_unit = '<spring:message code="product.unit" text="Unit" />';
		var lang_note = '<spring:message code="product.note" text="Note" />';
		var lang_laundry = '<spring:message code="product.laundry" text="Laundry" />';
		var lang_dryclean = '<spring:message code="product.dryclean" text="Dryclean" />';
		var lang_pressonly = '<spring:message code="product.pressonly" text="PressOnly" />';
		var lang_action = '<spring:message code="product.action" text="Action" />';
		var lang_confirm_delete_text = '<spring:message code="common.confirm.delete.text" text="Confirm delete text" />';
		var lang_confirm_delete = '<spring:message code="common.confirm.delete" text="Confirm delete" />';
		var lang_continue = '<spring:message code="common.continue" text="Continue" />';
		var lang_cancel = '<spring:message code="common.cancel" text="Cancel" />';
		var lang_delete_success = '<spring:message code="product.delete.success" text="Delete successfully" />';
		var lang_delete_fail = '<spring:message code="product.delete.fail" text="Fail to delete" />';
		var lang_get_fail = '<spring:message code="product.get.fail" text="Fail to get Product" />';
		var lang_add_success = '<spring:message code="product.add.success" text="Add product successully" />';
		var lang_add_fail = '<spring:message code="product.add.fail" text="Add product successully" />';
		var lang_edit_success = '<spring:message code="product.edit.success" text="Edit product successully" />';
		var lang_edit_fail = '<spring:message code="product.edit.fail" text="Fail to edit product" />';
		
		$(document).ready(function(){
			activeCurrentMenu();
			
			$('#search-product-select').select2({
				theme: "bootstrap"
			});

			angular.element($('#template-div')).scope().getListProduct();
			
		});
	
	</script>
	
</div>

