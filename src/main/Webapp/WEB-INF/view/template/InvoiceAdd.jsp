<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="add-invoice-view">
	<div class="row">
		
		<!-- load customer for invoice -->
		<div class="col-sm-6 customer-invoice-div">
			<select class="form-control" id="customer-invoice">
			</select>
		</div> <!-- end customer-invoice -->
		
		<div class="col-sm-12">
			<div class="panel panel-success panel-customer">
      			<div class="panel-heading">Thông tin khách hàng</div>
      			<div class="panel-body">
      				<div class="col-sm-4">
      					<span class="c-title">Khách hàng:</span>
      					<span ng-bind="customer.name"></span>
      				</div>
      				<div class="col-sm-4">
      					<span class="c-title">Địa chỉ:</span>
      					<span ng-bind='customer.address'></span>
      				</div>
      				<div class="col-sm-2">
      					<span class="c-title">SDT:</span>
      					<span ng-bind="customer.phone"></span>
      				</div>
      				<div class="col-sm-2">
      					<span class="c-title">Email:</span>
      					<span ng-bind="customer.email"></span>
      				</div>
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
								<td rowspan="2">Món Giặt</td>
								<td colspan="3">Giặt nước</td>
								<td colspan="3">Giặt hấp</td>
								<td colspan="3">Chỉ ủi</td>
								<td rowspan="2">Ghi chú</td>
							</tr>
							<tr>
								<td>Đ.giá</td>
								<td>S.lượng</td>
								<td>T.tiền</td>
								
								<td>Đ.giá</td>
								<td>S.lượng</td>
								<td>T.tiền</td>
								
								<td>Đ.giá</td>
								<td>S.lượng</td>
								<td>T.tiền</td>
							</tr>
						</thead>
						
						<tbody>
						</tbody>
					</table>
				</div> <!-- end panel default -->
			</div> <!-- end table-responsive -->
						
			<div class="amount-total-tbl-footer">
				<div class="col-sm-6 form-group col-note">
					<span id="invoice_note_title">Nhập ghi chú</span>
					<textarea class="form-control" rows="5" ng-model="invoice_info.note"></textarea>
				</div>
				
				<div class="col-sm-6 col-total">
					<ul class="list-group">
					   <li class="list-group-item" id="express-li">Giặt nhanh thêm 50% <span class="right"><input ng-change="express_wash()" ng-model="cbk.express_wash" type="checkbox" /></span></li>
					   <li class="list-group-item">Tổng cộng <span class="right label label-primary" id="amount-total"></span></li>
					   <li class="list-group-item">Đã thanh toán <span class="right"> <input style="text-align: right" ng-blur="handleTotalPay()" ng-model="invoice_info.totalPay" type="number" /></span></li>
					   <li class="list-group-item">Còn nợ lại <span id="invoice_remain" class="right label label-primary"></span></li> 
					</ul>
				</div>
					
			</div> <!-- end total-amount -->
			
			<button ng-click="saveInvoice()" type="button" class="btn btn-success btn-block">Lưu</button>
		
		</div> <!-- end col-sm-12 content -->
	</div>
	
	<!-- Modal zone -->
	<div id="invoice-cfr-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">		        
	      <div class="modal-body">
	        <div class="invoide-cfr-title">Xác nhận thông tin hóa đơn</div>
	        <div class="invoice-cfr-content">
	        	<div class="panel panel-default table-responsive">
	    			<table class="table bootstrap-table">
	    				<tr style="font-weight: bold">
	    					<td>Tên</td>
	    					<td>Địa chỉ</td>
	    					<td>SDT</td>
	    					<td>Email</td>
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
				    			<td>Món đồ</td>
				    			<td>Kiểu giặt</td>
				    			<td class="cus-number">số lượng</td>
				    			<td class="cus-number">Đơn giá</td>
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
	        <button ng-click="saveInvoiceDB()" type="button" class="btn btn-success" data-dismiss="modal">Tiếp Tục</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// declare variable

			angular.element($('#template-div')).scope().initSearchCustomerSelect2();
			$('.customer-invoice-div span.select2.select2-container.select2-container--bootstrap').css("width", "100%");
			
			// call this function from here instead of inside controller to avoid
			// blank data in table tbody in some case poor network...
			angular.element($('#template-div')).scope().addInvoice();
			angular.element($('#template-div')).scope().initSelect2Event();
			
		});
		
		var loadX = function() {
			angular.element($('#template-div')).scope().customer.name = 'loadxxx';
		}

		
	</script>
</div>