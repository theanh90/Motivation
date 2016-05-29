<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="view-invoice-view">
	<div class="row">
		<div class="col-sm-8">
			<h3 id="h-invoiceid"><spring:message code='invoice.numberid' text='invoiceid' /></h3>
			
			<div class="panel panel-default table-responsive">
    			<table class="table bootstrap-table">
    				<tr style="font-weight: bold">
    					<td><spring:message code="customer.fullname" text="Name" /></td>
    					<td><spring:message code="customer.address" text="Addess" /></td>
    					<td><spring:message code="customer.phone" text="Phone" /></td>
    					<td><spring:message code="customer.email" text="Email" /></td>	    				
    				</tr>	    				
    				<tr>
    					<td id="c-invoice-view-name"></td>
    					<td id="c-invoice-view-address"></td>
    					<td id="c-invoice-view-phone"></td>
    					<td id="c-invoice-view-email"></td>
    				</tr>
    			</table>
   			</div> <!-- end panel-default -->
			
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
		
		<span id="c-print-span">			
		</span>
		
		<div class="c-print-holder c-hidden">
			<html>
				<head>
					<title>Print Bill</title>
					<link rel="stylesheet" href="<c:url value='/static/font-awesome-4.5.0/css/font-awesome.min.css' />"> 
					<style type="text/css">
						body {
							font-family: sans-serif;
						}
						.print-div {
							width: 284px;
 							/* border: 1px solid black; */
						}
						
						.print-div .p-header {
						    text-align: center;
					    }
					    .print-div .p-header .slogan {
					    	font-size: 90%;
					    }
					    .print-div .p-header .p-shopname {
					    	font-weight: bold;
					    }
						.print-div .p-header img {
						    width: 200px;
						}
						
						.print-div .p-content {
							text-align: center;
						}						
						.print-div .p-content .p-invoice-id {
							font-weight: bold;
							font-size: 130%;
							margin-top: 10px;
							margin-bottom: 10px;
						}
						.print-div .p-content .p-invoice-customer {
							text-align: left;
							margin-bottom: 10px;
						}
						.print-div .p-content .p-invoice-date {
							text-align: right;
						}
						.print-div .p-content .p-invoice-detail {
							font-size: 85%;
						}
						.print-div .p-content .p-invoice-detail{
							border-top: 1px dashed black;
    						border-bottom: 1px dashed black;
						}
						.print-div .p-content .p-invoice-detail tbody {
							font-size: 90% !important;
						}
						.print-div .p-content .p-invoice-detail .cus-number {
							text-align: right;
						}
						.print-div .p-content .p-invoice-detail .c-bold {
							font-weight: bold;
						}
						
						.print-div .p-content .p-invoice-detail .c-bottom td {
							border-bottom: 1px dotted black;
						}
						
						.print-div .p-footer {
					        text-align: center;
						    padding: 10px;
						    font-size: 95%;
						}
						.print-div .p-footer p {
							margin: 0px;
						}
						.print-div .p-footer p.p-last {
					        border-bottom: 1px dashed black;
						    display: inline;
						    margin-top: 0px;
						    padding-bottom: 10px;
						}
						
						
					</style>
				</head>
				<body>
					<div class="print-div">
						<div class="p-header">
							<img class="img-responsive" src="<c:url value='/static/laundromax/images/logo-laundromax.png' />">
							<div class="p-shopname">LAUNDROMAX SUNRISE CITY</div>
							<div class="slogan">B1 V5 South Tower: 0945.580.147</div>
							<hr>
							<div class="slogan">Clean, Fresh Looking Your Best!</div>
							<hr>
						</div>
						<div class="p-content">
							<div class="p-invoice-date"></div>
							<div class="p-invoice-id">ID: #<span id="p-invoice-id-span"></span></div>
							<div class="p-invoice-customer">
								<div>
									<i class="fa fa-user" aria-hidden="true"></i> - 
									<span class="p-invoice-cname"></span>
								</div>
								<div>
									 <i class="fa fa-map-marker" aria-hidden="true"></i>  - 
									<span class="p-invoice-cadd"></span>
								</div>
								<div>
									<i class="fa fa-phone" aria-hidden="true"></i> - 
								 	<span class="p-invoice-cphone"></span>
							 	</div>
							</div>
							<div class="p-invoice-detail">
								<table class="table bootstrap-table">
									<thead>
					    				<tr>
					    					<td><b>Món Đồ</b> (Item)</td>
					    					<td><b>Dịch Vụ</b> (Service)</td>
					    					<td class="cus-number"><b>S.Lg</b> (Qtt)</td>
					    					<td class="cus-number"><b>T.Tiền</b> (VND)</td>	    				
					    				</tr>
				    				</thead>
				    				<tbody>	
				    				</tbody>
				    			</table>
							</div>
						</div>
						<div class="p-footer">
							<p>Cảm ơn và hẹn gặp lại! :)</p>
							<p class="p-last">Thank you and see you again! :)</p>
						</div>
						
					</div>
				</body>
			</html>
		</div>
		
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