<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="invoice-view">
	<a type="button" class="btn btn-success" href = "#invoice/addinvoice"><i class="fa fa-plus"></i></a>
	<div class="row">
		<div class="col-sm-6 content">
			<div>				
				<div class="input-group">				
		            <div class="input-group-btn">
	            		<select ng-change="searchInvoiceChange()" style="width: 120px" id="search-invoice-select" ng-model="search.type">
	            		  <option value="all" selected="selected"><spring:message code='customer.search.all' text='all' /></option>
	            		  <option value="status">Status</option>
						  <option value="name"><spring:message code='invoice.name' text='name' /></option>
						  <option value="note"><spring:message code='product.note' text='note' /></option>
						  <%-- <option value="date"><spring:message code='invoice.date' text='date' /></option> --%>
						  <option value="id"><spring:message code='common.id' text='id' /></option>
						</select>
		            </div>
					<input id="invoice-search-input" type="text" class="form-control" placeholder="<spring:message code='customer.search.inputSearch' text='Input search' />" 
						ng-model="search.input">
						
					<div style="display: none" id="invoice-status-search-div">
						<select style="width: 150px" id="invoice-status-search" ng-model="search.status_type">
	            		  <%-- <option value="0" selected="selected"><spring:message code='customer.search.all' text='all' /></option> --%>
	            		  <option value="1">New</option>
						  <option value="2">Sent partner</option>
						  <option value="3">Receive partner</option>
						  <option value="4">Delivery</option>
						</select>
					</div>
					
					<div class="input-group-btn">
		            	<button type="button" ng-click="doSearch()" class="btn btn-success"><span class="glyphicon glyphicon-search"></span></button>
		            </div>
				</div>				
			</div>
		</div> <!-- end class col-sm content -->
	</div> <!-- end class row -->
	
	<div class="row">
		<div class="col-sm-3">
			<input placeholder='From' type='text' class='form-control' id='from-timepicker'/>
		</div>
		<div class="col-sm-3">
			<input placeholder='To' type='text' class='form-control' id='to-timepicker'/>
		</div>
	</div>
	
	<div id="list-template-div">
		<table id="list-invoice"></table>		
	</div>
	
	
	
<script type="text/javascript">
	$(document).ready(function(){
		activeCurrentMenu();
		
		$('#search-invoice-select').select2({
			theme: "bootstrap"
		});
		
		$('#invoice-status-search').select2({
			theme: "bootstrap"	
		});
		
		angular.element($('#template-div')).scope().getListProduct();
		
		$('#from-timepicker').datetimepicker({
			 format: 'DD/MM/YYYY',
			 showClear: true
		});
		
		$('#to-timepicker').datetimepicker({
			format: 'DD/MM/YYYY',
			showClear: true
		});
	});
	
	
	
</script>
</div>

