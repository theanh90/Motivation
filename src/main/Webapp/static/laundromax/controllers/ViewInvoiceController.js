mainApp.controller('ViewInvoiceController', function($scope, $http, $route) {
	$scope.invoice_id = $route.current.params.id;
	
	$scope.getInvoice = function() {
		$http({
			   method: 'GET',
			   url: 'api/invoice/getbyid?id=' + $scope.invoice_id
		   
		   })
		   .then(function(response){
		   		if (response.data.returnStatus == 'SUCCESS') {
				  	console.log(response);
				  	$scope.invoice = response.data.data;
				  	console.log($scope.invoice);
				  	
				  	var product;
					var tbl_products = $('#invoice-view-tbl tbody');
					var tbl_content;
					var wash_type;
					
					tbl_products.html('');
					for (x in $scope.invoice) {
						tbl_content = '';
						product = $scope.invoice[x];
						product_name = product.vnName + " (" + product.enName + ")";
						if (product.typePrice == 'laundry') {
							wash_type = lang_laundry;
						} else if (product.typePrice == 'dryclean') {
							wash_type = lang_dryclean;
						} else if (product.typePrice == 'pressonly') {
							wash_type = lang_pressonly;
						}
						
						tbl_content += '<tr>';
						tbl_content +=    '<td>' + product_name + '</td>';
						tbl_content +=    '<td>' + wash_type + '</td>';
						tbl_content +=    '<td class="cus-number">' + product.quantity + '</td>';
						tbl_content +=    '<td class="cus-number">' + changeNumberFormat(product.unitPrice) + '</td>';
						tbl_content += '</tr>';
						
						tbl_products.append(tbl_content);
					}
					
					var tbl_total = $('#invoice-view-total');
					var tbl_total_html = '';
					
					if ($scope.invoice[0].isExpress) {
						tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_express + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
					}
					if ($scope.invoice[0].discount) {
						tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_discount + '</td> <td class="cus-number">' + $scope.invoice[0].discount + '% </td> </tr>';
					}
					if ($scope.invoice[0].vat) {
						tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_vat + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
					}
										
					tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_total + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice) + ' VND </td> </tr>';
					tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_paid_upfront + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPay) + ' VND </td> </tr>';
					tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_due_amount + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay) + ' VND </td> </tr>';
					
					tbl_total.html(tbl_total_html);
					
			  }else {
//				  var mess = lang_get_fail;
				  var type = 'ERROR';
				  showConfirmModal(mess, type);				  
			  }
			  			  
		   }, function(error){
			   alert("The error occurs when get Invoice details!!!" + error.statusText);
		   });
	}
	
	// call function on loaded
	$scope.getInvoice();
});