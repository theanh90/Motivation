<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="add-invoice-view">
	<div class="row">
		
		<!-- load customer for invoice -->
		<div class="col-sm-6 customer-invoice-div">
			<select class="" id="customer-invoice">
 				<option value="3620194" selected="selected">select2/select2</option>
			</select>
		</div> <!-- end customer-invoice -->
	
		<div class="col-sm-12 content">
			<div class="table-responsive">
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
			</div> <!-- end table-responsive -->
						
			<div class="amount-total-tbl-footer">
				<div class="col-sm-6 form-group col-note">
					<span id="invoice_note_title">Nhập ghi chú</span>
					<textarea class="form-control" rows="5" ng-model="invoice_info.note"></textarea>
				</div>
				
				<div class="col-sm-6 col-total">
					<ul class="list-group">
					   <li class="list-group-item" id="express-li">Giặt nhanh thêm 50% <span class="right"><input ng-change="express50()" ng-model="cbk.express50" type="checkbox" /></span></li>
					   <li class="list-group-item">Tổng cộng <span class="right label label-primary" id="amount-total"></span></li>
					   <li class="list-group-item">Khách hàng thanh toán <span class="right"> <input style="text-align: right" ng-blur="handleTotalPay()" ng-model="invoice_info.totalPay" type="number" /></span></li>
					   <li class="list-group-item">Còn nợ lại <span id="invoice_remain" class="right label label-primary"></span></li> 
					</ul>
				</div>
					
			</div> <!-- end total-amount -->
			
			<button ng-click="saveInvoice()" type="button" class="btn btn-success btn-block">Lưu</button>
		
		</div> <!-- end col-sm-12 content -->
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){

			/* angular.element($('#template-div')).scope().initSearchCustomerSelect2(); */
			xxx();
		
		});
		
		function xxx() {
			alert("xxx");
			$("#customer-invoice").select2({
				containerCssClass: 'tpx-select2-container',
				dropdownCssClass: 'tpx-select2-drop',
				ajax : {
					url : '<c:url value="/message/getcontacts"/>',
					type : "GET",
					contentType : "application/json",
					delay : 250,
					multiple : true,
					allowClear : true,
					//quietMillis: 100,
					data : function(params) {
						return {
							search : params.term,
							page : params.page
						};
					}
				}
			});
		}
	</script>
</div>