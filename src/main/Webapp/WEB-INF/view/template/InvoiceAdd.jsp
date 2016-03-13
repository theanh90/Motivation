<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="add-invoice-view">
	<div class="row">
		<div class="col-sm-12 content">
			<table id="list-product-tbl" class="table table-striped table-hover table-bordered bootstrap-table">
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
		
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){

			/* angular.element($('#template-div')).scope().addInvoice(); */
		
		});
		
		function xxx() {
			alert('clicked');
		}
	</script>
</div>