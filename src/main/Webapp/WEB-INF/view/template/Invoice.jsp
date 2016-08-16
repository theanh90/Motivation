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
	            		  <option value="status"><spring:message code='invoice.status' text='status' /></option>
						  <option value="name"><spring:message code='invoice.name' text='name' /></option>
						  <option value="note"><spring:message code='product.note' text='note' /></option>
						  <option value="id"><spring:message code='common.id' text='id' /></option>
						</select>
		            </div>
					<input id="invoice-search-input" type="text" class="form-control" placeholder="<spring:message code='customer.search.inputSearch' text='Input search' />" 
						ng-model="search.input">
						
					<div style="display: none" id="invoice-status-search-div">
						<select style="width: 150px" id="invoice-status-search" ng-model="search.status_type">
	            		  <option value="1"><spring:message code='common.invoice.status.new' text='new' /></option>
	            		  <option value="2"><spring:message code='common.invoice.status.confirmed' text='confirmed' /></option>
						  <option value="3"><spring:message code='common.invoice.status.sent' text='sent to partner' /></option>
						  <option value="4"><spring:message code='common.invoice.status.receive' text='receive from partner' /></option>
						  <option value="5"><spring:message code='common.invoice.status.delivery' text='delvery' /></option>
						  <%-- <option value="6"><spring:message code='invoice.status.requestCancel' text='request cancel' /></option> --%>
						  <option value="-1"><spring:message code='common.invoice.status.requestcancel' text='request cancel' /></option>
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

	/* language variable */
	var lang_customer = "<spring:message code='menunav.customer' text='customer' />";
	var lang_note = "<spring:message code='customer.note' text='note' />";
	var lang_totalPrice = "<spring:message code='invoice.totalPrice' text='total price' />";
	var lang_totalPay = "<spring:message code='invoice.totalPay' text='total pay' />";
	var lang_dueAmount = "<spring:message code='invoice.dueAmount' text='due amount' />";
	var lang_status = "<spring:message code='invoice.status' text='status' />";
	var lang_createdDate = "<spring:message code='invoice.createdDate' text='created date' />";

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
		
		animationTransition();
	});

	
</script>
</div>

