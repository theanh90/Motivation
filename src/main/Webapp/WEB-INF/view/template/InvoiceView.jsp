<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="view-invoice-view">
	<div class="row">
		<div class="col-sm-8">
			<h3 id="h-invoiceid"><spring:message code='invoice.numberid' text='invoiceid' /></h3>
			
			<div class="panel panel-default table-responsive">
		    	<table id="invoice-view-tbl" class="table bootstrap-table">
		    		<thead>
			    		<tr style="font-weight: bold">
			    			<td><spring:message code='menunav.item' text='Item' /></td>
			    			<td><spring:message code='invoice.washService' text='wash service' /></td>
			    			<td class="cus-number"><spring:message code='invoice.quantity' text='quantity' /></td>
			    			<td class="cus-number"><spring:message code='invoice.subTotal' text='sub total' /></td>
			    		</tr>			    		
		    		</thead>
		    		<tbody></tbody>
		    	</table>
			</div> <!-- end panel-default -->  
			
			<div id="invoice-note" class="panel panel-default table-responsive">
			    
			</div> <!-- end panel-default -->
			
			<div class="panel panel-default table-responsive">
			    <table id="invoice-view-total" class="table bootstrap-table">
		    	</table>
			</div> <!-- end panel-default --> 
		
		</div> <!-- end col-sm-8 -->
		
		<div class="col-sm-4 invoice-view-status">
			<div class="form-group">
				<label for="current-status"><spring:message code="invoice.currentStatus" text="current status" /></label>
				<div id="current-status"></div>
			</div>
		</div>
		
		<div class="col-sm-4">
			<div class="form-group c-fg-change-status">
				<label for="change-status"><spring:message code="invoice.changeStatus" text="change status" /></label>
				<div>
					<a id="change-status" href class="w3-btn w3-margin-bottom" ng-click="confirmChange()"></a>
				</div>
			</div>
		</div>
		
		<span id="c-delete-span">			
		</span>
		
		<span id="c-request-cancel-span">			
		</span>
		
	</div>
	
	<script type="text/javascript">
		// multiple language variable		
		var lang_laundry = '<spring:message code="product.laundry" text="Laundry" />';
		var lang_dryclean = '<spring:message code="product.dryclean" text="Dryclean" />';
		var lang_pressonly = '<spring:message code="product.pressonly" text="PressOnly" />';
		var lang_discount = '<spring:message code="invoice.discount" text="discount" />';
		var lang_vat = '<spring:message code="invoice.vat" text="vat" />';
		var lang_express = '<spring:message code="invoice.expressWash" text="express washing" />';
		var lang_total = '<spring:message code="invoice.total" text="total" />';
		var lang_paid_upfront = '<spring:message code="invoice.paidUpfront" text="paid upfront" />';
		var lang_due_amount = '<spring:message code="invoice.dueAmount" text="due amount" />';
		var lang_note = '<spring:message code="product.note" text="Note" />';
		var lang_invoice_confirm_changestatus = '<spring:message code="invoice.changeStatus.confirm" text="are you sure to change this Invoice status?" />';
		var lang_invoice_confirm_delete = '<spring:message code="invoice.delete.confirm" text="are you sure to delete this Invoice?" />';
		var lang_invoice_delete_text = '<spring:message code="invoice.delete.text" text="delete Invoice" />';
		var lang_invoice_request_text = '<spring:message code="invoice.request.text" text="request cancel" />';
		var lang_invoice_confirm_request = '<spring:message code="invoice.request.confirm" text="are you sure to send request cancel to Admin?" />';
		
		var lang_invoice_change_success = '<spring:message code="invoice.change.success" text="change invoice status successfully" />';
		var lang_invoice_remove_success = '<spring:message code="invoice.remove.success" text="remove invoice successfully" />';
		var lang_invoice_sendrequest_success = '<spring:message code="invoice.sendrequest.success" text="send request cancel to Admin successfully" />';
		
		$(document).ready(function(){
			angular.element($('#template-div')).scope().getInvoice();
		});
	</script>
</div>