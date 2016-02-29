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
	            		<select id="search-product-select" ng-model="search.type">
						  <option value="all"><spring:message code='product.vnName' text='VN Name' /></option>
						  <option value="name"><spring:message code='product.enName' text='EN Name' /></option>
						  <option value="phone"><spring:message code='product.note' text='Note' /></option>
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
	
	<!-- Modal notify -->
	<div id="confirm-product-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-sm">	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
	        <h4 class="modal-title"><spring:message code='common.confirm' text='Confirm' /></h4>
	      </div>
	      <div class="modal-body">
	        <h4 id="confirm-content"></h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-success" data-dismiss="modal"><spring:message code='common.close' text='Close' /></button>
	      </div>
	    </div>
	
	  </div>
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
		        		<td><input id="product-name-vn" data-toggle="tooltip" title="<spring:message code='product.valid.vnName' text='VN Name is required' />" ng-model="product.nameVn" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.enName' text='EN Name' />: <span style="color: red">*</span></td>
		        		<td><input id="product-name-en" data-toggle="tooltip" title="<spring:message code='product.valid.enName' text='EN Name is required' />" ng-model="product.nameEn" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.unit' text='Unit' />: <span style="color: red">*</span> </td>
		        		<td><input id="product-unit" data-toggle="tooltip" title="<spring:message code='product.valid.unit' text='Unit is required' />" ng-model="product.unit" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.laundryPrice' text='Laundry' />: <span style="color: red">*</span></td>
		        		<td><input id="product-laundry" data-toggle="tooltip" title="<spring:message code='product.valid.laundry' text='Laundry price is required' />" ng-model="product.laundry" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.drycleanPrice' text='Dryclean' />: <span style="color: red">*</span></td>
		        		<td><input id="product-dryclean" data-toggle="tooltip" title="<spring:message code='product.valid.dryclean' text='Dryclean price is required' />" ng-model="product.dryclean" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='product.pressOnlyPrice' text='PressOnly' />: <span style="color: red">*</span></td>
		        		<td><input id="product-pressonly" data-toggle="tooltip" title="<spring:message code='product.valid.pressonly' text='Pressonly price is required' />" ng-model="product.pressonly" type="text"></td>
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
	        <h4 class="modal-title">Sửa thông tin khách hàng</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table edit-product-table">
	        	<tbody>
		        	<tr>
		        		<td class="text-field">Họ tên: <span style="color: red">*</span></td>
		        		<td><input id="product-name-edit" data-toggle="tooltip" title="Hãy nhập họ tên" ng-model="edit_product.name" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field">Điện thoại: <span style="color: red">*</span> </td>
		        		<td><input id="product-phone-edit" data-toggle="tooltip" title="Số điện thoại không đúng" ng-model="edit_product.phone" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field">Địa chỉ: <span style="color: red">*</span> </td>
		        		<td><input id="product-address-edit" data-toggle="tooltip" title="Hãy nhập địa chỉ" ng-model="edit_product.address" type="text"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field">Ghi chú: </td>
		        		<td>
		        			<input hidden id="product-id-edit" ng-model="edit_product.id" type="text">
		        			<textarea style="width: 100%" ng-model="edit_product.note" rows="5" id="product-note-edit"></textarea>
		        		</td>
		        	</tr>
	        	</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	      	<button id="edit-product-btn" type="button" class="btn btn-success" ng-click="save('PUT')">Lưu</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
	      </div>
	    </div> <!-- end modal Edit content -->
	
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('#search-product-select').select2({
				  containerCssClass: 'tpx-select2-container',
				  dropdownCssClass: 'tpx-select2-drop'
			});
			
			$("#search-product-select").select2('val', 'all'); 

			angular.element($('#template-div')).scope().getListProduct();
			
		});
	
	</script>
	
</div>

