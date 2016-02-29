<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		
  		<!-- Font awesome -->
  		<link rel="stylesheet" href="<c:url value='static/font-awesome-4.5.0/css/font-awesome.min.css' />">  		
		
  		<!-- Jquery -->
		<script src="<c:url value='static/jquery/1.12.0/jquery.min.js' />"></script>	
		
  		<!-- AngularJs -->
  		<script src="<c:url value='static/angularjs/1.5.0-rc.1/angular.min.js' />"> </script>
  		<script src="<c:url value='static/angularjs/1.5.0-rc.1/angular-route.min.js' />"> </script>	
		
		<!-- Bootstrap -->
		<link href="<c:url value='static/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='static/bootstrap/js/bootstrap.min.js'/>"> </script>
  		
  		<!-- Bootstrap table -->
  		<link href="<c:url value='static/bootstrap-table/dist/bootstrap-table.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='static/bootstrap-table/dist/bootstrap-table.min.js'/>"> </script>
  		
  		<!-- Bootstrap-dialog -->
  		<link href="<c:url value='static/bootstrap-dialog/bootstrap-dialog.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='static/bootstrap-dialog/bootstrap-dialog.min.js'/>"> </script>
  		
  		<!-- Bootstrap-from-helper -->
		<link href="<c:url value='static/bootstrap-form-helper/css/bootstrap-formhelpers.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='static/bootstrap-form-helper/js/bootstrap-formhelpers.min.js'/>"> </script>
  		
  		<!-- Select2 -->
  		<link href="<c:url value='static/select2/select2.css'/>" rel="stylesheet">
  		<link href="<c:url value='static/select2/select2-skins.min.css'/>" rel="stylesheet">	
  		<script src="<c:url value='static/select2/select2.min.js'/>"> </script>
  		  		
  		<!-- My css -->
  		<link href="<c:url value='static/laundromax/css/style.css'/>" rel="stylesheet">	
		
		<title>GIẶT ỦI LAUNDROMAX</title>
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
		      <!-- <a class="navbar-brand" href="#home">Laundromax</a> -->
		      <a id="li-nav-home" class="navbar-brand" href="#home"><i style="color: white" class="fa fa-2x fa-home"></i></a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        <li onclick="setActive(this, 'x')" class="li-nav-menu">
		        	<a href="#customer"><spring:message code='menunav.customer' text='Customer' /></a>
	        	</li>
		        <li onclick="setActive(this)" class="li-nav-menu">
		        	<a href="#product"><spring:message code='menunav.item' text='Item' /></a>
	        	</li>
		        <li onclick="setActive(this)" class="li-nav-menu">
		        	<a href="#invoice"><spring:message code='menunav.invoice' text='Invoice' /></a>
	        	</li>
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
			<div ng-include src="'static/laundromax/templates/Home.html'"></div>	
   		</script>
   		
   		<!-- view for customer -->
   		<script type = "text/ng-template" id = "customer">		
			<div ng-include src="'template/angular/customer'"></div>	
   		</script>
   		
   		<!-- view for product -->
   		<script type = "text/ng-template" id = "product">		
			<div ng-include src="'template/angular/product'"></div>	
   		</script>
   		
   		<!-- view for invoice -->
   		<script type = "text/ng-template" id = "invoice">		
			<div ng-include src="'static/laundromax/templates/Invoice.html'"></div>	
   		</script>
		
		
		<div class="container-fluid">
			<div class="row">
			  <div class="col-sm-12 content">	  	
			  	<div class="laundromax-header">			  		
			  		<div class="row">
					    <div class="col-sm-6">
					    	<a onclick="setHomeMenu()" href="#home">
					    		<img class="img-responsive" src="static/laundromax/images/logo-laundromax.png" alt="Laundromax">
				    		</a>
					    </div>
					    <div class="col-sm-6 info-header">
					    	<div>
					    		<p>
					    			<i class="fa fa-2x fa-phone"></i>
					    			<span style="color: #008fca">+841229576222 - Miss Thịnh</span>
				    			</p>
					    		<p>
					    			<i class="fa fa-2x fa-map-marker"></i>
					    			<span style="color: #008fca">8901 Marmora Road Glasgow, DO4 89GR.</span>
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
				
				</div>
			  	
			  </div><!-- end content div -->
		  	</div><!-- end row div -->
	  	</div><!-- end container-fluid div -->
	  	
	  	<div class="language-div" style="float:right">
			<a href="?language=en">
	        	<i class="glyphicon bfh-flag-US"></i>
	        	<%-- <spring:message code='language.english' text='English' /> --%>
	        </a>
	        |&nbsp;
	        <a href="?language=vn">
	             <i class="glyphicon bfh-flag-VN"></i>
	            <%--  <spring:message code='language.vietnam' text='Vietnamese' /> --%>
	        </a>	  	
	  	</div>
		 
	  	<!-- CSRF token -->
	  	<input type="hidden" id="token" value="${_csrf.token}" />
	  	
		<!-- load AngularJs controller file -->
		<script src="static/laundromax/app.js"></script>
		<script src="static/laundromax/controllers/CustomerController.js"></script>
		<script src="static/laundromax/controllers/HomeController.js"></script>
		<script src="static/laundromax/controllers/InvoiceController.js"></script>
		<script src="static/laundromax/controllers/ProductController.js"></script>
		
	</body>
	
	<script type="text/javascript">
		$(document).ready(function() { 
			window.location.href='#/home';
			$('#li-nav-home').css('background-color', '#fe8f01');
			
			$('#li-nav-home').click(function(){
				$('#li-nav-home').css('background-color', '#fe8f01');
				$('.li-nav-menu').removeClass('active');
			});
		});
		
		function setHomeMenu() {
			$('#li-nav-home').css('background-color', '#fe8f01');
			$('.li-nav-menu').removeClass('active');
		}
		
		function setActive(node) {
			$('.li-nav-menu').removeClass('active');
			$('#li-nav-home').css('background-color', '#3d3d3d');
			$(node).addClass('active');
		}
	</script>
</html>