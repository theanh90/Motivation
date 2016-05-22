<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="view-invoice-view">
	<div class="row">
		<h1>Invoice view</h1>
		
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
		
		<div class="panel panel-default table-responsive">
		    <table id="invoice-view-total" class="table bootstrap-table">
	    	</table>
		</div> <!-- end panel-default --> 
		
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
		
		$(document).ready(function(){
			
		});
	</script>
</div>