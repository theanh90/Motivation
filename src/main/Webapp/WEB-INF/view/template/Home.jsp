<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="template-div" class="inout-view">
	
	<div class="row">
		<div class="col-sm-12 content">
			<div class="panel panel-primary">
			  	<div class="panel-heading"><spring:message code="report.header" text="Report all of money activity in shop" /></div>
			  	<div class="panel-body">	  		
					<div class="row" id="revenuebox">
						<div class="col-xs-12" >
							<div class="box o-box">
							    <div class="box-header o-box__header c-report-header">
							    	<h3 class="box-title"><spring:message code="report.title" text="Activities report" /></h3>
							    	
								  	<div class="form-group">
							          	<div class="input-group">
								          	<label><spring:message code="report.select.day" text="Select date time: " /> </label>
											<div id="daterange-btn" class="pull-right" >
											    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
											    <span id="daterange"></span> <b class="caret"></b>
											</div>    
							        	</div>
								    </div>     
							    </div><!-- /.box-header -->
					
							    <div class="box-body o-box__body" >
									<div class="col-xs-6">
										    <div class="info-box">
										        <span class="info-box-icon u-text-green"><i style="color: green" class="fa fa-cart-arrow-down"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.invoice" text="Total invoice" /></span>
										        	<span class="info-box-number" id="total-invoice"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
									<div class="col-xs-6">
										    <div class="info-box">
										        <span class="info-box-icon u-text-green"><i style="color: blue" class="fa fa-usd"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.price" text="Total invoice cost" /></span>
										        	<span class="info-box-number" id="total-price"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
									<div class="col-xs-6">
										    <div class="info-box">
										        <span class="info-box-icon u-text-green"><i style="color: blue" class="fa fa-usd"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.pay" text="Total already pay" /></span>
										        	<span class="info-box-number" id="total-pay"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
									<div class="col-xs-6">
										    <div class="info-box">
										        <span class="info-box-icon u-text-green"><i style="color: blue" class="fa fa-usd"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.due" text="Total due" /></span>
										        	<span class="info-box-number" id="total-due"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
									
									<hr>
									
									<div class="col-xs-6">
										    <div class="info-box">
										        <span class="info-box-icon u-text-green"><i style="color: blue" class="fa fa-usd"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.put" text="Total money in Put" /></span>
										        	<span class="info-box-number" id="total-put"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
									<div class="col-xs-6">
										    <div class="info-box">
										        <span class="info-box-icon u-text-green"><i style="color: blue" class="fa fa-usd"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.withdraw" text="Total money in Withdraw" /></span>
										        	<span class="info-box-number" id="total-withdraw"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
									<div class="col-xs-12">
										    <div class="info-box total-money">
										        <span class="info-box-icon u-text-green"><i style="color: red" class="fa fa-money"></i></span>
										        <div class="info-box-content">
										    	    <span class="info-box-text"><spring:message code="report.total.money" text="TOAL MONEY IN THIS SHOP" /></span>
										        	<span class="info-box-number" id="total-money"></span>										        	
										        </div><!-- /.info-box-content -->
										    </div><!-- /.info-box -->
									</div>
					
								</div>
					
							</div>
					
						</div>
					
					</div> <!-- /.row -->	
			  	</div>
			</div>
		</div> <!-- end class col-sm content -->
	</div> <!-- end class row -->
	
	
	<script type="text/javascript">
		/* global languages variable */
		var lang_invoice = "<spring:message code='menunav.invoice' text='Invoice' />";
		
		var select_start;
		var select_end;
	
		$(document).ready(function() {
			dateRangeView(moment().startOf('week'), moment());
			angular.element($('#template-div')).scope().controllerReady();
		});

		function dateRangeView(start, end) {
			select_start = start;
			select_end = end;
			
	    	$('#daterange-btn span').html(start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY'));

	    	angular.element($('#template-div')).scope().loadReportDate();
	    }

		$('#daterange-btn').daterangepicker({
	      	opens: 'right',
	      	ranges: {
	        	'Hôm nay': [moment(), moment()],
	        	'Tuần này': [moment().startOf('week'), moment()],
	        	'Tháng này': [moment().startOf('month'), moment()],
	        	'Năm này': [moment().startOf('year'), moment().endOf('year')]
	      	},
	       	"locale": {
	            "format": "DD/MM/YYYY",
	            "separator": " - ",
	            "applyLabel": "Xác nhận",
	            "cancelLabel": "Hủy",
	            "fromLabel": "Từ",
	            "toLabel": "Tới",
	            "customRangeLabel": "Tùy chỉnh",
	            "daysOfWeek": [
	                "CN",
	                "T2",
	                "T3",
	                "T4",
	                "T5",
	                "T6",
	                "T7"
	            ],
	            "monthNames": [
	                "Tháng 1,",
	                "Tháng 2,",
	                "Tháng 3,",
	                "Tháng 4,",
	                "Tháng 5,",
	                "Tháng 6,",
	                "Tháng 7,",
	                "Tháng 8,",
	                "Tháng 9,",
	                "Tháng 10,",
	                "Tháng 11,",
	                "Tháng 12,"
	            ],
	            "firstDay": 1
	        },
	      	startDate: moment(),
	      	endDate: moment(),
	      	dateLimit: { days: 30 },
	     	autoUpdateInput: true
	    },
	    dateRangeView
	);

	</script>
	
</div>









