<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		
  		<!-- Font awesome -->
  		<link rel="stylesheet" href="<c:url value='static/font-awesome-4.5.0/css/font-awesome.min.css' />">  		
		
  		<!-- Jquery -->
		<script src="<c:url value='static/jquery/1.12.0/jquery.min.js' />"></script>		
		
		<!-- Bootstrap -->
		<link href="<c:url value='static/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='static/bootstrap/js/bootstrap.min.js'/>"> </script>
  		
  		<!-- Bootstrap-from-helper -->
		<link href="<c:url value='static/bootstrap-form-helper/css/bootstrap-formhelpers.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='static/bootstrap-form-helper/js/bootstrap-formhelpers.min.js'/>"> </script>
  		
  		<!-- Bootflat -->
  		<!-- <link href="static/bootflat/css/bootflat.min.css" rel="stylesheet">
  		<script src="static/bootstrap/js/icheck.min.js"></script> -->
  		
  		<!-- AngularJs -->
  		<script src="<c:url value='static/angularjs/1.5.0-rc.1/angular.min.js' />"> </script>
  		<script src="<c:url value='static/angularjs/1.5.0-rc.1/angular-route.min.js' />"> </script>
  		
		
		<title>Login page</title>
        
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
        <style type="text/css">
			body{background: #eee url(http://subtlepatterns.com/patterns/sativa.png);}
			html,body{
			    position: relative;
			    height: 100%;
			}
			
			.login-container{
			    position: relative;
			    width: 300px;
			    margin: 80px auto;
			    padding: 20px 40px 40px;
			    text-align: center;
			    background: #fff;
			    border: 1px solid #ccc;
			}
			
			#output{
			    position: absolute;
			    width: 300px;
			    top: -75px;
			    left: 0;
			    color: #fff;
			}
			
			#output.alert-success{
			    background: rgb(25, 204, 25);
			}
			
			#output.alert-danger{
			    background: rgb(228, 105, 105);
			}
			
			
			.login-container::before,.login-container::after{
			    content: "";
			    position: absolute;
			    width: 100%;height: 100%;
			    top: 3.5px;left: 0;
			    background: #fff;
			    z-index: -1;
			    -webkit-transform: rotateZ(4deg);
			    -moz-transform: rotateZ(4deg);
			    -ms-transform: rotateZ(4deg);
			    border: 1px solid #ccc;
			
			}
			
			.login-container::after{
			    top: 5px;
			    z-index: -2;
			    -webkit-transform: rotateZ(-2deg);
			     -moz-transform: rotateZ(-2deg);
			      -ms-transform: rotateZ(-2deg);
			
			}
			
			.avatar{
			    width: 100px;height: 100px;
			    margin: 10px auto 30px;
			    border-radius: 100%;
			    border: 2px solid #aaa;
			    background-size: cover;
			}
			
			.form-box input{
			    width: 100%;
			    padding: 10px;
			    text-align: center;
			    height:40px;
			    border: 1px solid #ccc;;
			    background: #fafafa;
			    transition:0.2s ease-in-out;
			
			}
			
			.form-box input:focus{
			    outline: 0;
			    background: #eee;
			}
			
			.form-box input[type="text"]{
			    border-radius: 5px 5px 0 0;
			    text-transform: lowercase;
			}
			
			.form-box input[type="password"]{
			    border-radius: 0 0 5px 5px;
			    border-top: 0;
			}
			
			.form-box button.login{
			    margin-top:15px;
			    padding: 10px 20px;
			}
			
			.animated {
			  -webkit-animation-duration: 1s;
			  animation-duration: 1s;
			  -webkit-animation-fill-mode: both;
			  animation-fill-mode: both;
			}
			
			@-webkit-keyframes fadeInUp {
			  0% {
			    opacity: 0;
			    -webkit-transform: translateY(20px);
			    transform: translateY(20px);
			  }
			
			  100% {
			    opacity: 1;
			    -webkit-transform: translateY(0);
			    transform: translateY(0);
			  }
			}
			
			@keyframes fadeInUp {
			  0% {
			    opacity: 0;
			    -webkit-transform: translateY(20px);
			    -ms-transform: translateY(20px);
			    transform: translateY(20px);
			  }
			
			  100% {
			    opacity: 1;
			    -webkit-transform: translateY(0);
			    -ms-transform: translateY(0);
			    transform: translateY(0);
			  }
			}
			
			.fadeInUp {
			  -webkit-animation-name: fadeInUp;
			  animation-name: fadeInUp;
			}
        </style>
    </head>
 
    <body>
        
        <div class="container-fluid">
			<div class="row">
			  <div class="col-sm-12">
				
				<spring:message code='language.language' text='Language' />
				:
				<a href="?language=en">
              		<i class="glyphicon bfh-flag-US"></i><spring:message code='language.english' text='English' />
             	</a>
             	|
             	<a href="?language=vn">
                	<i class="glyphicon bfh-flag-VN"></i><spring:message code='language.vietnam' text='Vietnamese' />
                </a>
								
			  	<div class="container">
					<div class="login-container">
			            <div id="output"></div>
			            <div class="avatar"></div>
			            <div class="form-box">
			                <form action="login" method="post">
			                	<c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <p>Invalid username and password.</p>
                                </div>
	                            </c:if>
	                            <c:if test="${param.logout != null}">
	                                <div class="alert alert-success">
	                                    <p><spring:message code='login.notifyLogout' text='Log out successfully' /></p>
	                                </div>
	                            </c:if>
	                            
			                    <input name="username" type="text" placeholder="<spring:message code='login.username' text='Username' />" >
			                    <input name="password" type="password" placeholder="<spring:message code='login.password' text='Password' />" >
			                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
			                    <button class="btn btn-info btn-block login" type="submit">
			                    	<spring:message code='login.login' text='Login' />
		                    	</button>
			                </form>
			            </div>
			        </div>
				        
				</div>
			  				
			  </div> <!-- end content div -->
			</div> <!-- end row div -->
		</div> <!-- end container-fluid div -->        
        
 
    </body>
</html>
