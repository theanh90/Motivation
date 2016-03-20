<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<!-- Jquery -->
		<script src="<c:url value='/static/jquery/1.12.0/jquery.min.js' />"></script>
		
		<!-- Bootstrap -->
		<link href="<c:url value='/static/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">		
  		<script src="<c:url value='/static/bootstrap/js/bootstrap.min.js'/>"> </script>
		
		<link href="<c:url value='/static/sl2/select2.css'/>" rel="stylesheet">
	  	<link href="<c:url value='/static/sl2/select2-bootstrap.css'/>" rel="stylesheet">
	  	<script src="<c:url value='/static/sl2/select2.full.min.js'/>"> </script>
	  	
	  	<style type="text/css">
	  		.select2 select2-container {
	  			width: 300px;
	  		}
	  	</style>
	  	
	</head>
	
	<body>
	
		<div>
			<h2>Test select 2</h2>
		</div>
		<div class="row">
		
			<div class="col-md-6" id="contentxx">			
				<select class="form-control input-lg" id="js-example-basic-single">
				</select>
			</div>
			
		</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			console.log('ready test');
			
			$("#js-example-basic-single").select2({
				ajax : {
					url : '<c:url value="/api/customer/listselect2"/>',
					type : "GET",
					contentType : "application/json",
					delay : 250,
					/* multiple : true,
					allowClear : true, */
					data : function(params) {
						return {
							textSearch : params.term
						};
					}, 
					/* placeholder : 'Nhập tên khách hàng', */
					processResults : function(data) {
						var rows = new Array();
						var row;
						
						for (x in data.rows) {
							row = data.rows[x];
							rows.push({
								id : row.cid,
								name : row.name,
								phone : row.phone,
								address : row.address,
								email : row.email,
								note : row.note
							})
						}
						
						return {results: rows}
					}
				},
				templateResult : function(data) {
					if (data.text && data.text.search('Searching') != -1) {
						return null;
					}
					return data.name + " - " + data.address + " - " + data.phone;
				},
				templateSelection : function (data) {
					if (!data.id) {
						return data.text;
					} else {
						return data.name + " - " + data.address;						
					}
				},
				theme: "bootstrap",
				placeholder: 'Nhập tên khách hàng'
			});
			var xxxx = $('#contentxx span.select2.select2-container.select2-container--bootstrap');
			xxxx.css("background-color", "yellow");
			xxxx.css("width", "100%");
			console.log(xxxx);
			/* console.log(xxxx.outerHTML()); */
	 	  
	 	  
		});
	</script>
	</body>
</html>