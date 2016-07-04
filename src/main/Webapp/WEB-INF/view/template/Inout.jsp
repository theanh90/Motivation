<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="inout-view">
	
	<button data-backdrop="static" type="button" class="btn btn-success" data-toggle="modal" data-target="#add-inout-modal">
		<i class="fa fa-plus"></i>
	</button>
	
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
		var lang_announ_who = "<spring:message code='inout.who' text='who' />";
		var lang_announ_money = "<spring:message code='inout.money' text='money' />";
		var lang_announ_reason = "<spring:message code='inout.reason' text='reason' />";
		var lang_announ_type_put = "<spring:message code='inout.type.put' text='Put' />";
		var lang_announ_type_withdraw = "<spring:message code='inout.type.withdraw' text='Withdraw' />";

		var lang_save_success = "<spring:message code='inout.save.success' text='Save In/Out money successfully' />";
		var lang_save_fail = "<spring:message code='inout.save.fail' text='Fail to save In/Out money' />";
	
	
		$(document).ready(function() {
			initInoutDate();
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
		}
	
	</script>
	
</div>