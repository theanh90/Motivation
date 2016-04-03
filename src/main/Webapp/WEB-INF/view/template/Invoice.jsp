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
	            		<select style="width: 120px" id="search-invoice-select" ng-model="search.type">
	            		  <option value="all" selected="selected"><spring:message code='customer.search.all' text='all' /></option>
						  <option value="name"><spring:message code='invoice.name' text='name' /></option>
						  <option value="note"><spring:message code='product.note' text='note' /></option>
						  <option value="date"><spring:message code='invoice.date' text='date' /></option>
						  <option value="id"><spring:message code='common.id' text='id' /></option>
						</select>
		            </div>
					<input type="text" class="form-control" placeholder="<spring:message code='customer.search.inputSearch' text='Input search' />" 
						ng-model="search.input">
					<div class="input-group-btn">
		            	<button type="button" ng-click="doSearch()" class="btn btn-success"><span class="glyphicon glyphicon-search"></span></button>
		            </div>
				</div>				
			</div>
		</div> <!-- end class col-sm content -->
	</div> <!-- end class row -->
	
	<div class="row">
		<div class="col-sm-3">
			<input placeholder="From" type='text' class="form-control" id='start-timepicker' />
		</div>
		<div class="col-sm-3">
			<input placeholder="To" type='text' class="form-control" id='end-timepicker' />
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
		
		angular.element($('#template-div')).scope().getListProduct();
		
		$('#start-timepicker').datetimepicker({
            sideBySide: true
		});
		
		$('#end-timepicker').datetimepicker({
            sideBySide: true
		});
	});
	
	
	
</script>
</div>

