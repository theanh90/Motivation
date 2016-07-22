<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link href="<c:url value='/static/laundromax/images/favicon.png' />" rel="icon" type="image/x-icon" />
  		
  		<!-- Font awesome -->
  		<link rel="stylesheet" href="<c:url value='/static/font-awesome-4.5.0/css/font-awesome.min.css' />">  		
		
  		<!-- Jquery -->
		<script src="<c:url value='/static/jquery/1.12.0/jquery.min.js' />"></script>	
		
  		<!-- AngularJs -->
  		<script src="<c:url value='/static/angularjs/1.5.0-rc.1/angular.min.js' />"> </script>
  		<script src="<c:url value='/static/angularjs/1.5.0-rc.1/angular-route.min.js' />"> </script>	
		
		<!-- Bootstrap -->
		<link href="<c:url value='/static/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='/static/bootstrap/js/bootstrap.min.js'/>"> </script>
  		
  		<!-- Bootstrap table -->
  		<link href="<c:url value='/static/bootstrap-table/dist/bootstrap-table.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='/static/bootstrap-table/dist/bootstrap-table.min.js'/>"> </script>
  		
  		<!-- Bootstrap-dialog -->
  		<link href="<c:url value='/static/bootstrap-dialog/bootstrap-dialog.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='/static/bootstrap-dialog/bootstrap-dialog.min.js'/>"> </script>
  		
  		<!-- Bootstrap-form-helper -->
		<link href="<c:url value='/static/bootstrap-form-helper/css/bootstrap-formhelpers.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='/static/bootstrap-form-helper/js/bootstrap-formhelpers.min.js'/>"> </script>
  	  		
  		<!-- Select2 temp -->
  		<link href="<c:url value='/static/sl2/select2.css'/>" rel="stylesheet">
	  	<link href="<c:url value='/static/sl2/select2-bootstrap.css'/>" rel="stylesheet">
	  	<script src="<c:url value='/static/sl2/select2.full.min.js'/>"> </script>
	  	
	  	<!-- Moment time library -->
  		<script src="<c:url value='/static/moment/moment.js'/>"> </script>
  		<script src="<c:url value='/static/moment/locale/vi.js'/>"> </script> 
  		
  		<!-- Bootstrap-datetime picker -->
  		<link href="<c:url value='/static/bootstrap-datatimepicker/bootstrap-datetimepicker.css'/>" rel="stylesheet">
	  	<script src="<c:url value='/static/bootstrap-datatimepicker/bootstrap-datetimepicker.js'/>"> </script>  
  		  		
  		<!-- My css -->
  		<link href="<c:url value='/static/laundromax/css/style.css'/>" rel="stylesheet">	
  		
		<!-- Webui-Popover -->
		<script src="<c:url value='/static/webui-popover/jquery.webui-popover.min.js'/>"> </script>
		<link href="<c:url value='/static/webui-popover/jquery.webui-popover.min.css'/>" rel="stylesheet">	
		
		<!-- Date Range Picker -->
		<script src="<c:url value='/static/daterangepicker/daterangepicker.js'/>"> </script>
		<link href="<c:url value='/static/daterangepicker/daterangepicker.css'/>" rel="stylesheet">	
		
		<!-- NotifyJs -->
		<script src="<c:url value='/static/notifyjs/notify.min.js'/>"> </script>
		
		<title>GIẶT ỦI LAUNDROMAX</title>
		
		<%@include file="../template/CommonJSP.jsp"%>
	</head>
	<body ng-app="mainApp">
	
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>                        
		      </button>
		      <a id="li-nav-home" class="navbar-brand" href="#home"><i style="color: white" class="fa fa-2x fa-home"></i></a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li onclick="setActive(this)" class="li-nav-menu customer-menu-li">
		        	<a href="#customer"><spring:message code='menunav.customer' text='Customer' /></a>
	        	</li>
		        <li onclick="setActive(this)" class="li-nav-menu product-menu-li">
		        	<a href="#product"><spring:message code='menunav.item' text='Item' /></a>
	        	</li>
		        <li onclick="setActive(this)" class="li-nav-menu invoice-menu-li">
		        	<a href="#invoice"><spring:message code='menunav.invoice' text='Invoice' /></a>
	        	</li>
 		        <li onclick="setActive(this)" class="li-nav-menu inout-menu-li">
		        	<a href="#inout"><spring:message code='menunav.money' text='Money' /></a>
	        	</li>
	        	<c:if test="${admin == 1}">
	 		        <li onclick="setActive(this)" class="li-nav-menu inout-menu-li">
			        	<a href="<c:url value='#admin' />"><spring:message code='menunav.admin' text='Admin' /></a>
		        	</li>
	        	</c:if>
		      </ul>
		      
		      <ul class="nav navbar-nav navbar-right">
		        <li>
		        	<a href="logout"><span class="glyphicon glyphicon-log-in"></span>
		        		&nbsp;<spring:message code='login.logout' text='Logout' />
		        	</a>		        
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
   		   		
   		<!-- view for home -->
   		<script type = "text/ng-template" id = "home">		
			<div ng-include src="'<c:url value='/template/angular/home' />'"></div>	
   		</script>
   		
   		<!-- view for customer -->
   		<script type = "text/ng-template" id = "customer">		
			<div ng-include src="'<c:url value='/template/angular/customer' />'"></div>	
   		</script>
   		
   		<!-- view for product -->
   		<script type = "text/ng-template" id = "product">		
			<div ng-include src="'<c:url value='/template/angular/product' />'"></div>	
   		</script>
   		
   		<!-- view for invoice -->
   		<script type = "text/ng-template" id = "invoice">		
			<div ng-include src="'<c:url value='/template/angular/invoice' />'"></div>	
   		</script>
   		<script type = "text/ng-template" id = "invoice/addinvoice">		
			<div ng-include src="'<c:url value='/template/angular/addinvoice' />'"></div>	
   		</script>   		
   		<script type = "text/ng-template" id = "invoice/viewinvoice">		
			<div ng-include src="'<c:url value='/template/angular/viewinvoice' />'"></div>	
   		</script>
   		
   		<!-- view for input/output money -->
   		<script type = "text/ng-template" id = "inout">		
			<div ng-include src="'<c:url value='/template/angular/inout' />'"></div>	
   		</script>
   		
   		<!-- view for admin -->
   		<script type = "text/ng-template" id = "admin">		
			<div ng-include src="'<c:url value='/template/angular/admin' />'"></div>	
   		</script>
		
		<div class="container-fluid">
			<div class="row">
			  <div class="col-sm-12 content">	  	
			  	<div class="laundromax-header">			  		
			  		<div class="row">
					    <div class="col-sm-6">
					    	<a onclick="setHomeMenu()" href="#home">
					    		<img class="img-responsive" src="<c:url value='/static/laundromax/images/logo-laundromax.png' />" alt="Laundromax">
				    		</a>
					    </div>
					    <div class="col-sm-6 info-header">
					    	<div>
					    		<p>
					    			<i class="fa fa-2x fa-phone"></i>
					    			<span style="color: #008fca">0984.017.179 - Miss Thịnh</span>
				    			</p>
					    		<p>
					    			<i class="fa fa-2x fa-map-marker"></i>
					    			<span style="color: #008fca">B1 V5 South Tower, Sunrise City, HCM</span>
				    			</p>					    	
					    	</div>
					    	
					    </div>					
					  </div>
			  	</div>  
				
			  </div> <!-- end content div -->
			</div> <!-- end row div -->
		</div> <!-- end container-fluid div -->
		
		
		<!-- For each view -->
		<div class="container-fluid container-my-view">
			<div class="row">
			  <div class="col-sm-12 content">
			  
				<div class="laundromax-view" ng-view>
					<h2>ahihi</h2>
				</div>
			  	
			  </div><!-- end content div -->
		  	</div><!-- end row div -->
	  	</div><!-- end container-fluid div -->
	  	
	  	<footer class="footer-distributed">

			<div class="footer-right">	  	
			  	<div class="language-div" style="float:right">
					<a href="?language=en">
			        	<i class="glyphicon bfh-flag-US"></i>
			        </a>
			        |&nbsp;
			        <a href="?language=vn">
			             <i class="glyphicon bfh-flag-VN"></i>
			        </a>	  	
			  	</div>
			</div>

			<div class="footer-left">

				<p class="footer-links">						        	
					<a href="#customer"><spring:message code='menunav.customer' text='Customer' /></a>
					·
					<a href="#product"><spring:message code='menunav.item' text='Item' /></a>
					·
					<a href="#invoice"><spring:message code='menunav.invoice' text='Invoice' /></a>
					·
					<a href="#inout"><spring:message code='menunav.money' text='Money' /></a>
					
					<c:if test="${admin == 1}">
						·
						<a href="#admin"><spring:message code='menunav.admin' text='Admin' /></a>
					</c:if>
					·
					<a href="<c:url value='/api/home/guide' />"><spring:message code='menunav.guide' text='Guide' /></a>
				</p>

				<p>Developed by Anh Bui - theanh90@gmail.com</p>
			</div>

		</footer>
		 
	  	<!-- CSRF token -->
	  	<input type="hidden" id="token" value="${_csrf.token}" />
	  	<input type="hidden" id="is-admin" value="${admin}" />
	  	
		<!-- load AngularJs controller file -->
		<script src="<c:url value='/static/laundromax/app.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/CustomerController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/HomeController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/InvoiceController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/AddInvoiceController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/ViewInvoiceController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/ProductController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/InOutMoneyController.js' />"></script>
		<script src="<c:url value='/static/laundromax/controllers/AdminController.js' />"></script>
		<script src="<c:url value='/static/laundromax/common.js' />"></script>
		
	</body>
	
	<script type="text/javascript">
		// global variable
	
		$(document).ready(function() {
						
			$('#li-nav-home').click(function(){
				$('#li-nav-home').css('background-color', '#fe8f01');
				$('.li-nav-menu').removeClass('active');
			});

			/* location.href = '#/home'; */
			activeCurrentMenu();
		});
		
		function activeCurrentMenu() {
			var hash = window.location.hash;
			if (!hash || hash.match(/^#\/home/i)) {
				setHomeMenu();
			}
			if (hash.match(/^#\/customer/i)) {
				setActive(".customer-menu-li");
			} else if (hash.match(/^#\/product/i)) {
				setActive(".product-menu-li");
			} else if (hash.match(/^#\/invoice/i)) {
				setActive(".invoice-menu-li");
			} else if (hash.match(/^#\/inout/i)) {
				setActive(".inout-menu-li");
			}
		}
		
		function setHomeMenu() {
			$('#li-nav-home').css('background-color', '#fe8f01');
			$('.li-nav-menu').removeClass('active');
		}
		
		function setActive(node) {
			$('.li-nav-menu').removeClass('active');
			$('#li-nav-home').css('background-color', '#3d3d3d');
			$(node).addClass('active');
			$('#myNavbar').removeClass('in');
		}
	</script>
</html>