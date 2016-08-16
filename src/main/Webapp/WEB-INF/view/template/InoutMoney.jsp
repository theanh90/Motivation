<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="inout-view">
	
	<button data-backdrop="static" type="button" class="btn btn-success" data-toggle="modal" data-target="#add-inout-modal">
		<i class="fa fa-plus"></i>
	</button>
	
	<div class="row">
		<div class="col-sm-6 content">
			<div>				
				<div class="input-group">				
		            <div class="input-group-btn">
	            		<select ng-change="searchInOutChange()" style="width: 120px" id="search-inout-select" ng-model="search.type">
						  <option value="all" selected="selected"><spring:message code='customer.search.all' text='All' /></option>
						  <option value="type"><spring:message code='inout.type' text='Type' /></option>
						  <option value="who"><spring:message code='inout.who' text='who' /></option>
						  <option value="reason"><spring:message code='inout.reason' text='reason' /></option>
						</select>
		            </div>
					<input id="inout-search-input" type="text" class="form-control" placeholder="<spring:message code='customer.search.inputSearch' text='Input search' />" ng-model="search.input">
					
					<div style="display: none" id="inout-type-search-div">
						<select style="width: 150px" id="inout-type-search" ng-model="search.input">
	            		  <option value="0"><spring:message code='inout.type.withdraw' text='Withdraw' /></option>
	            		  <option value="1"><spring:message code='inout.type.put' text='Put' /></option>
						</select>
					</div>
					
					<div class="input-group-btn">
		            	<button type="button" ng-click="doSearch()" class="btn btn-success"><span class="glyphicon glyphicon-search"></span></button>
		            </div>
				</div>				
			</div>
		</div> <!-- end class col-sm content -->
	</div> <!-- end class row -->
	
	<div id="list-template-div">
		<table id="list-inout-money"></table>
		
	</div>
	
	<!-- Modal -->
	<div id="add-inout-modal" class="modal fade" role="dialog">
	  <div class="modal-dialog">	
	    <!-- Modal Add content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title"><spring:message code='inout.addNew' text='put/withdraw money' /></h4>
	      </div>
	      <div class="modal-body">
	        <table class="table add-inout-table">
	        	<tbody>
		        	<tr>
		        		<td class="text-field"><spring:message code='inout.type' text='Type' />: <span style="color: red">*</span></td>
		        		<td>
		        			<div id="inout-type-div" data-toggle="tooltip" title="<spring:message code='inout.valid.type' text='Type is required' />">
		        				<label class="radio-inline"><input ng-model="inout.type" value="put" type="radio" name="inout-type-radio"><spring:message code='inout.type.put' text='put' /></label>
		        				<label class="radio-inline"><input ng-model="inout.type" value="withdraw" type="radio" name="inout-type-radio"><spring:message code='inout.type.withdraw' text='withdrow' /></label>
	        				</div>
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='inout.date' text='date time' />: <span style="color: red">*</span> </td>
		        		<td>
		        			<input id="inout-date" type="text" onkeydown="return false;" data-toggle="tooltip" title="<spring:message code='inout.valid.date' 
		        				text='Date is required' />"/>
	        			</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='inout.who' text='who' />: <span style="color: red">*</span> </td>
		        		<td><input id="inout-who" ng-model="inout.who" type="text" data-toggle="tooltip" title="<spring:message code='inout.valid.who' 
		        				text='Who is required' />"></td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='inout.money' text='money' />: <span style="color: red">*</span> </td>
		        		<td>
		        			<input id="inout-money" min="0" data-toggle="tooltip" title="<spring:message code='inout.valid.money' 
		        				text='Money is required' />" ng-model="inout.money" type="number">
        				</td>
		        	</tr>
		        	<tr>
		        		<td class="text-field"><spring:message code='inout.reason' text='reason' />: <span style="color: red">*</span> </td>
		        		<td>
	        				<textarea id="inout-reason" style="width: 100%" ng-model="inout.reason" rows="5" data-toggle="tooltip" 
	        					title="<spring:message code='inout.valid.reason' text='Reason is required' />" >
	        				</textarea>
        				</td>
		        	</tr>
	        	</tbody>
	        </table>
	      </div>
	      <div class="modal-footer">
	      	<button id="save-inout-btn" type="button" class="btn btn-success" ng-click="saveInOut('POST')"><spring:message code='common.save' text='Save' /></button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code='common.close' text='Close' /></button>
	      </div>
	    </div> <!-- end modal add content -->
	
	  </div>
	</div>
	
	<script type="text/javascript">
		/* global languages variable */
		var common_confirm = '<spring:message code="common.confirm" text="Confirm" />';
		var	common_continue = '<spring:message code="common.continue" text="Continue" />';
		var	common_cancel = '<spring:message code="common.cancel" text="Cancel" />';

		var lang_announ_type = "<spring:message code='inout.type' text='Type' />";
		var lang_announ_date = "<spring:message code='inout.date' text='Date' />";
		var lang_announ_datecancel = "<spring:message code='inout.date.cancel' text='Date cancel' />";
		var lang_announ_who = "<spring:message code='inout.who' text='who' />";
		var lang_announ_whocancel = "<spring:message code='inout.who.cancel' text='who\'s cancel' />";
		var lang_announ_money = "<spring:message code='inout.money' text='money' />";
		var lang_announ_reason = "<spring:message code='inout.reason' text='reason' />";
		var lang_announ_type_put = "<spring:message code='inout.type.put' text='Put' />";
		var lang_announ_type_withdraw = "<spring:message code='inout.type.withdraw' text='Withdraw' />";

		var lang_save_success = "<spring:message code='inout.save.success' text='Save In/Out money successfully' />";
		var lang_save_fail = "<spring:message code='inout.save.fail' text='Fail to save In/Out money' />";
		var lang_customer_action = '<spring:message code="customer.action" text="Action" />';
		var lang_inout_delete_success = '<spring:message code="inout.delete.success" text="delete in/out money successfully" />';
		var lang_inout_delete_fail = '<spring:message code="inout.delete.fail" text="Fail to delete in/out money" />';
		var	common_confirm_delete_text = '<spring:message code="common.confirm.delete.text" text="Delete confirm text" />';
		var common_confirm_delete = '<spring:message code="common.confirm.delete" text="Delete confirm" />';
		var lang_input_whoCancel = '<spring:message code="inout.whocancel.input" text="Input who cancel" />';
		var lang_input_whoCancel_validate = '<spring:message code="inout.whocancel.validate" text="Who\'s cancel is required" />';
		var lang_cancelled = '<spring:message code="inout.cancelled" text="Cancelled" />';
	
		$(document).ready(function() {
			initInoutDate();
			
			$('#search-inout-select').select2({
				theme: "bootstrap"
			});
			
			$('#inout-type-search').select2({
				theme: "bootstrap"	
			});

			angular.element($('#template-div')).scope().getListInOutMoney();
		});

		function initInoutDate() {
			var today = new Date();
			$('#inout-date').datetimepicker({
				sideBySide: true,
				showTodayButton: true,
				format: 'DD/MM/YYYY HH:mm',
				defaultDate: today,
				showClose: true,
				toolbarPlacement: 'top',
				showTodayButton: true,
				locale: moment.locale('vi')
			});
			
			animationTransition();
		}
	
	</script>
	
</div>