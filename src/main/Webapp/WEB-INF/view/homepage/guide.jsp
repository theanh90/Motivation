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
		
		<!-- Bootstrap -->
		<link href="<c:url value='/static/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='/static/bootstrap/js/bootstrap.min.js'/>"> </script>
	  	
	  	<!-- Moment time library -->
  		<script src="<c:url value='/static/moment/moment.js'/>"> </script>
  		<script src="<c:url value='/static/moment/locale/vi.js'/>"> </script> 
  		  		
  		<!-- My css -->
  		<link href="<c:url value='/static/laundromax/css/style.css'/>" rel="stylesheet">	
		
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
		      <a id="li-nav-home" class="navbar-brand" href="<c:url value='/#/home' />"><i style="color: white" class="fa fa-2x fa-home"></i></a>
		    </div>
		    <div class="collapse navbar-collapse" id="myNavbar">
		      <ul class="nav navbar-nav">
		        
		      </ul>
		      
		      <ul class="nav navbar-nav navbar-right">
		        <li>
		        			        
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
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
			  
				<div class="laundromax-view-guide" >				
					<div class="container">
						<h2>Hướng dẫn sử dụng</h2>
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#guide-tab-invoice-status">Trạng thái hóa đơn</a></li>
							<li><a data-toggle="tab" href="#print-bill">In Bill</a></li>
							<li><a data-toggle="tab" href="#delete-invoice">Xóa Hóa đơn</a></li>
							<li><a data-toggle="tab" href="#payment">Thanh toán</a></li>
							<li><a data-toggle="tab" href="#return-invoice">Nhà Giặt không giặt</a></li>
						</ul>
					
						<div class="tab-content">
							<div id="guide-tab-invoice-status" class="tab-pane fade in active">
							    <h3>Các trạng thái của một Hóa Đơn</h3>
							    <div>
							    	Mới 
							    	<i class="fa fa-angle-double-right"></i>
							    	Xác nhận 
							    	<i class="fa fa-angle-double-right"></i>
							    	Giao cho nhà giặt 
							    	<i class="fa fa-angle-double-right"></i>
							    	Nhận từ nhà giặt 
							    	<i class="fa fa-angle-double-right"></i>
							    	Giao khách hàng 
							    	<i class="fa fa-angle-double-right"></i>
							    	Báo hủy
							    </div>
							</div>
							<div id="print-bill" class="tab-pane fade">
							    <h3>Các trạng thái được phép in bill</h3>
							    <div>
							    	<p>Từ trạng thái <b>Xác nhận</b> trở đi thì đều có thể in bill</p>
							    </div>
							</div>
							<div id="delete-invoice" class="tab-pane fade">
							    <h3>Xóa hoặc hủy Hóa Đơn</h3>
							    <p>Chỉ có trạng thái <b>Mới</b> thì mới được xóa Hóa Đơn. </p>
							    <p>Còn lại chỉ được <b>Yêu cầu Hủy</b>. Yêu cầu hủy là báo cho Admin biết bill đó cần hủy.</p>
							    <p>Chỉ có trạng thái <b>Xác nhận</b> là được phép <b>Yêu cầu hủy</b></p>
							</div>
							<div id="payment" class="tab-pane fade">
							    <h3>Thanh toán tiền cho Hóa Đơn</h3>
							    <p>Khi Hóa đơn còn nợ, thì nút <b>Thanh Toán</b> sẽ hiển thị. Khi đã thanh toán hết thì nút <b>Thanh Toán</b>
							    	sẽ biến mất
							    </p>
							</div>
							<div id="return-invoice" class="tab-pane fade">
							    <h3>Khi Nhà Giặt trả lại 1 hoặc 1 số hoặc tất cả món đồ trong hóa đơn</h3>
							    <p> 
							    	Khi bên Nhà Giặt trả lại đồ mà không giặt (vì lý do đồ đó không giặt được) thì Nhân Viên sẽ báo cho Admin, 
							    	Admin sẽ đăng nhập vào hệ thống bằng tài khoản Admin. Admin sẽ có quyền xóa Hóa đơn đó.
							    	</br>
							    	Trường hợp nhà Giặt chỉ trả lại một số món đồ trong hóa đơn, và đã giặt một số món khác. Thì sẽ tạo 1 Hóa đơn mới,
							    	trong hóa đơn mới, nhập tất cả các món đồ mà nhà giặt đã giặt (không nhập các món nhà giặt trả lại), 
							    	ghi chú đầy đủ lý do tạo Hóa đơn đó (nhà giặt trả lại....). Phần còn lại thì báo cho Admin xóa Hóa đơn cũ đi. 
							    </p>
							</div>
						</div>
					</div>
				</div>
			  </div><!-- end content div -->
		  	</div><!-- end row div -->
	  	</div><!-- end container-fluid div -->
	  	
	  	<footer class="footer-distributed">

			

		</footer>

		
	</body>
	
	<script type="text/javascript">
		// global variable
		
		animationTransition();
	</script>
</html>