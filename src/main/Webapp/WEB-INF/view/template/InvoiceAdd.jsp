<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="add-invoice-view">
	<div class="row">
		
		<!-- Reserved for handle invoice is denied from partner -->
		<div class="partner-deny-div c-hidden">
			<div class="col-sm-10">
				<div class="panel panel-danger">
					<div id="partner-deny-panel" class="panel-heading">
						<p> Nhập các món đồ mà nhà giặt đã chấp nhận giặt (không nhập các món đồ mà nhà giặt từ chối giặt)</p>
						<p> Nếu nhà giặt từ chối giặt tất cả các món đồ có trong Hóa đơn thì bấm vào nút <b>Từ chối giặt tất cả</b> bên cạnh</p>
					</div>
				</div>
			</div>
			
			<div class="col-sm-2">
				<button class="btn btn-warning btn-lg">Từ chối giặt tất cả</button>
			</div>
		</div>
		
		<!-- load customer for invoice -->
		<div class="col-sm-6 customer-invoice-div">
			<select class="form-control" id="customer-invoice">
			</select>
		</div> <!-- end customer-invoice -->
		
		<div class="col-sm-12">
			<div class="panel panel-success panel-customer">
      			<div class="panel-heading"><spring:message code="invoice.customerinfo" text="customer information" /></div>
      			<div class="panel-body">
      				<div class="col-sm-4">
      					<span class="c-title"><spring:message code="customer.fullname" text="Name" />:</span>
      					<span ng-bind="customer.name"></span>
      				</div>
      				<div class="col-sm-4">
      					<span class="c-title"><spring:message code="customer.address" text="Addess" />:</span>
      					<span ng-bind='customer.address'></span>
      				</div>
      				<div class="col-sm-2">
      					<span class="c-title"><spring:message code="customer.phone" text="Phone" />:</span>
      					<span ng-bind="customer.phone"></span>
      				</div>
      				<div class="col-sm-2">
      					<span class="c-title"><spring:message code="customer.email" text="Email" />:</span>
      					<span ng-bind="customer.email"></span>
      				</div>
      			</div>
    		</div>
		</div>
		
		<div class="col-sm-3">
			<div class="form-group">
                <div class='input-group date' id='add-invoice-date'>
                    <input id="date-invoice-input" type='text' class='form-control' onkeydown="return false;"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
			</div>
		</div>
	
		<div class="col-sm-12 content">
			<div class="table-responsive">
				<div class="panel panel-default">
					<table id="list-product-tbl" class="table table-striped table-hover table-bordered 
							bootstrap-table">
						<thead>
							<tr>
								<td rowspan="2"><spring:message code='menunav.item' text='Item' /></td>
								<td colspan="3"><spring:message code="product.laundry" text="Laundry" /></td>
								<td colspan="3"><spring:message code="product.dryclean" text="Dryclean" /></td>
								<td colspan="3"><spring:message code="product.pressonly" text="PressOnly" /></td>
								<td rowspan="2"><spring:message code="product.note" text="Note" /></td>
							</tr>
							<tr>
								<td><spring:message code="invoice.unitPrice" text="unit price" /></td>
								<td><spring:message code="invoice.quantity" text="quantity" /></td>
								<td><spring:message code="invoice.subTotal" text="sub total" /></td>
								
								<td><spring:message code="invoice.unitPrice" text="unit price" /></td>
								<td><spring:message code="invoice.quantity" text="quantity" /></td>
								<td><spring:message code="invoice.subTotal" text="sub total" /></td>
								
								<td><spring:message code="invoice.unitPrice" text="unit price" /></td>
								<td><spring:message code="invoice.quantity" text="quantity" /></td>
								<td><spring:message code="invoice.subTotal" text="sub total" /></td>
							</tr>
						</thead>
						
						<tbody>
						</tbody>
					</table>
				</div> <!-- end panel default -->
			</div> <!-- end table-responsive -->
						
			<div class="amount-total-tbl-footer">
				<div class="col-sm-6 form-group col-note">
					<span id="invoice_note_title"><spring:message code="invoice.leaveANote" text="leave a note" /></span>
					<textarea class="form-control" rows="5" ng-model="invoice_info.note"></textarea>
				</div>
				
				<div class="col-sm-6 col-total">
					<ul class="list-group">
					   <li class="list-group-item" id="express-li"><spring:message code="invoice.expressWash" text="express washing" /> <span class="right"><input ng-change="express_wash()" ng-model="cbk.express_wash" type="checkbox" /></span></li>
					   <li class="list-group-item" id="discount-li"><spring:message code="invoice.discount" text="discount" /> <span class="right"><input ng-blur="changeDiscount()" ng-model="invoice_info.discount" type="number" min="1" max="100"/></span></li>
					   <li class="list-group-item" id="vat-li"><spring:message code="invoice.vat" text="vat" /> <span class="right"><input ng-change="changeVAT()" ng-model="cbk.vat" type="checkbox" /></span></li>
					   <li class="list-group-item"><spring:message code="invoice.total" text="total" /> <span class="right label label-primary" id="amount-total"></span></li>
					   <li class="list-group-item"><spring:message code="invoice.paidUpfront" text="paid upfront" /> <span class="right totalpay-span"> <input ng-blur="handleTotalPay()" ng-model="invoice_info.totalPay" type="number" /></span></li>
					   <li class="list-group-item"><spring:message code="invoice.dueAmount" text="due amount" /> <span id="invoice_remain" class="right label label-primary"></span></li> 
					</ul>
				</div>
					
			</div> <!-- end total-amount -->
			
			<button ng-click="saveInvoice()" type="button" class="btn btn-success btn-block"><spring:message code="common.save" text="save" /></button>
		
		</div> <!-- end col-sm-12 content -->
	</div>
	
	<!-- Modal zone -->
	<div id="invoice-cfr-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">		        
	      <div class="modal-body">
	        <div class="invoide-cfr-title"><spring:message code="invoice.confirmInfo" text="information confirm" /> </div>
	        <div class="invoice-cfr-content">
	        	<div class="panel panel-default table-responsive">
	    			<table class="table bootstrap-table">
	    				<tr style="font-weight: bold">
	    					<td><spring:message code="customer.fullname" text="Name" /></td>
	    					<td><spring:message code="customer.address" text="Addess" /></td>
	    					<td><spring:message code="customer.phone" text="Phone" /></td>
	    					<td><spring:message code="customer.email" text="Email" /></td>	    				
	    				</tr>	    				
	    				<tr>
	    					<td ng-bind="customer.name"></td>
	    					<td ng-bind='customer.address'></td>
	    					<td ng-bind="customer.phone"></td>
	    					<td ng-bind="customer.email"></td>
	    				</tr>
	    			</table>
    			</div> <!-- end panel-default -->
    			
   				<div class="panel panel-default table-responsive">
			    	<table id="invoice-cfr-products" class="table bootstrap-table">
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
				    <table id="invoice-cfr-total" class="table bootstrap-table">
			    	</table>
				</div> <!-- end panel-default --> 			
	        </div>
	      </div>
	      
	      <div class="modal-footer">
	        <button ng-click="saveInvoiceDB()" type="button" class="btn btn-success" data-dismiss="modal">
	        	<spring:message code='common.save' text='save' />
	        </button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">
	        	<spring:message code='common.cancel' text='cancel' />
	        </button>
	      </div>
	    </div>
	
	  </div>
	</div>
	
	<script type="text/javascript">
		// multiple language variable		
		var lang_input_holder =  '<spring:message code="invoice.inputCustomerName" text="input customer name" />';
		var lang_laundry = '<spring:message code="product.laundry" text="Laundry" />';
		var lang_dryclean = '<spring:message code="product.dryclean" text="Dryclean" />';
		var lang_pressonly = '<spring:message code="product.pressonly" text="PressOnly" />';
		var lang_express = '<spring:message code="invoice.expressWash" text="express washing" />';
		var lang_total = '<spring:message code="invoice.total" text="total" />';
		var lang_paid_upfront = '<spring:message code="invoice.paidUpfront" text="paid upfront" />';
		var lang_due_amount = '<spring:message code="invoice.dueAmount" text="due amount" />';
		var lang_valid_select_item = '<spring:message code="invoice.validate.selectItem" text="pls select item" />';
		var lang_valid_select_customer = '<spring:message code="invoice.validate.selectCustomer" text="pls select customer" />';
		var lang_add_success = '<spring:message code="invoice.add.success" text="add invoice successfully" />';
		var lang_add_fail = '<spring:message code="invoice.add.fail" text="fail to add invoice" />';
		var lang_confirm = '<spring:message code="common.confirm" text="confirm" />';
		var lang_validate_missing = '<spring:message code="invoice.validate.miss" text="information is missing" />';
		var lang_discount = '<spring:message code="invoice.discount" text="discount" />';
		var lang_vat = '<spring:message code="invoice.vat" text="vat" />';		
		var lang_error_get = '<spring:message code="invoice.error.product.get" text="error when get list product" />';
	
		$(document).ready(function(){			
			activeCurrentMenu();

			angular.element($('#template-div')).scope().initSearchCustomerSelect2();
			angular.element($('#template-div')).scope().checkLinkFromPartnerDeny();
			$('.customer-invoice-div span.select2.select2-container.select2-container--bootstrap').css("width", "100%");
			
			// call this function from here instead of inside controller to avoid
			// blank data in table tbody in some case poor network...
			angular.element($('#template-div')).scope().addInvoice();
			angular.element($('#template-div')).scope().initSelect2Event();

			initAddInvoiceDatetimePicker();
		});
		
		/* var loadX = function() {
			angular.element($('#template-div')).scope().customer.name = 'loadxxx';
		} */

		function initAddInvoiceDatetimePicker() {
			var today = new Date();
			$('#add-invoice-date').datetimepicker({
				sideBySide: true,
				showTodayButton: true,
				format: 'DD/MM/YYYY HH:mm',
				defaultDate: today,
				showClose: true,
				toolbarPlacement: 'top',
				showTodayButton: true,
				locale: moment.locale('vi')
			});
		}
		
	</script>
</div>