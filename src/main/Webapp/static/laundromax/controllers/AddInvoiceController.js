mainApp.controller('AddInvoiceController', function($scope, $http) {
	var csrf = $('#token').val();
	
	$scope.list_product = new Array();
	$scope.invoice_info = {
			express_wash : 0,
			totalPay : null,
			note : null
	};
	$scope.cbk = {
			express_wash : false
	};
	$scope.customer = {};
	
	$scope.isExpress = 1;	
	
	// functions
	$scope.addInvoice = function() {
		var data = {
				sort: 'desc',
				order: 'name'
		}
		$http({
			   method: 'GET',
			   url: 'api/product/list',
			   params: {
				   sort: 'vnName',
				   order: 'asc',
				   offset: 0,
				   typeSearch: 'all',
				   textSearch: ''
			   }
		   
		   })
		   .then(function(response){
			   var tbody = $('#list-product-tbl tbody');
			   var row;
			   var data;			   

			   // global variable
			   product_all = {};
			   
			   for (var i=0; i<response.data.rows.length; i++) {
				   data = response.data.rows[i];
				   product_all[data.pid] = data;
				   
				   row = '';
				   
				   row += '<tr pid="' + data.pid + '">';
				   row += 		'<td>' + data.vnName + ' (' + data.enName + ')' + '</td>';
				   
				   row += 		'<td price="' + data.laundry + '" id="' + data.pid + '_laundry_price' + '" class="price">' + changeNumberFormat(data.laundry) + '</td>';
				   row += 		'<td class="qtt">' + '<input id="' + data.pid + '_laundry' + '" type="number" min="0" onchange="changeQTT(this, \'laundry\')" />' + '</td>';
				   row += 		'<td id="' + data.pid + '_laundry_amount' + '" >' + '' + '</td>';
				   
				   row += 		'<td price="' + data.dryclean + '" id="' + data.pid + '_dryclean_price' + '" class="price">' + changeNumberFormat(data.dryclean) + '</td>';
				   row += 		'<td class="qtt">' + '<input id="' + data.pid + '_dryclean' + '" type="number" min="0" onchange="changeQTT(this, \'dryclean\')" />' + '</td>';
				   row += 		'<td id="' + data.pid + '_dryclean_amount' + '" >' + '' + '</td>';
				   
				   row += 		'<td price="' + data.pressonly + '" id="' + data.pid + '_pressonly_price' + '" class="price">' + changeNumberFormat(data.pressonly) + '</td>';
				   row += 		'<td class="qtt">' + '<input id="' + data.pid + '_pressonly' + '" type="number" min="0" onchange="changeQTT(this, \'pressonly\')" />' + '</td>';
				   row += 		'<td id="' + data.pid + '_pressonly_amount' + '" >' + '' + '</td>';
				   
				   row += 		'<td>' + data.note + '</td>';
				   row += '</tr>';
				   
				   tbody.append(row);
			   }
			  
		   }, function(error){
			   alert("The error occurs when Saving/Update Product!!!" + error.statusText);
		   });
	}
	
	changeQTT = function(element, price_type) {
		var row = $(element).closest('tr');
		var pid = row.attr('pid');
		var qtt = $(element).val();
		
		if (qtt > 0) {
			// disable 2 other input
			row.addClass('selected-pro-row');			
			$scope.disableInputElement(pid, price_type);
		} else if (qtt == 0) {
			// enable 2 other input
			row.removeClass('selected-pro-row');
			$scope.enableInputElement(pid);
		} else {
			return false;
		}
		
		// remove old value to avoid duplicate product id
		for (var i=0; i<$scope.list_product.length; i++) {
			if ($scope.list_product[i].pid == pid) {
				$scope.list_product.splice(i, 1);
				break;
			}
		}
		
		if (qtt == 0) {
			$scope.displayAmout(pid, price_type, qtt);
			$scope.calculateTotalPrice();
			return;
		}
		
		// display amout for each product
		price = $scope.displayAmout(pid, price_type, qtt);	
		$scope.list_product.push({pid: pid, price_type: price_type, qtt: qtt, unit_price: price});
		$scope.calculateTotalPrice();
	}
	
	$scope.displayAmout = function(pid, price_type, qtt) {
		var amount_element;
		var price_element;
		var price;
		var amount;
		switch(price_type) {
			case 'laundry':
				amount_element = $('#' + pid + '_laundry_amount');
				price = $('#' + pid + '_laundry_price').attr('price');
				amount = parseInt(price * qtt);
				
				if (qtt == 0) {
					amount_element.html('');
				} else {
					amount_element.html(changeNumberFormat(amount));
					amount_element.addClass('selected-pro');
				}
				break;
				
			case 'dryclean':
				amount_element = $('#' + pid + '_dryclean_amount');
				price = $('#' + pid + '_dryclean_price').attr('price');
				amount = parseInt(price * qtt);
				
				if (qtt == 0) {
					amount_element.html('');
				} else {
					amount_element.html(changeNumberFormat(amount));	
					amount_element.addClass('selected-pro');
				}
				break;
				
			case 'pressonly':
				amount_element = $('#' + pid + '_pressonly_amount');
				price = $('#' + pid + '_pressonly_price').attr('price');
				amount = parseInt(price * qtt);
				
				if (qtt == 0) {
					amount_element.html('');
				} else {
					amount_element.html(changeNumberFormat(amount));
					amount_element.addClass('selected-pro');
				}
				break;
		}
		
		return price;
	}
	
	$scope.calculateTotalPrice = function() {
		var result = 0;
		var index;
		
		for (x in $scope.list_product) {
			index = $scope.list_product[x];
			result += (index.unit_price * index.qtt);
		}
		
		$('#amount-total').html(changeNumberFormat(result * $scope.isExpress) + " VND");
		$scope.invoice_info.totalPrice = result;
		// update remain price after user change select
		$scope.handleTotalPay();
	}
	
	$scope.disableInputElement = function(pid, price_type) {		
		switch(price_type) {
			case 'laundry':
				$('#' + pid + '_dryclean').val('');
				$('#' + pid + '_dryclean').prop('disabled', 'disabled');
				$('#' + pid + '_pressonly').val('');
				$('#' + pid + '_pressonly').prop('disabled', 'disabled');
				break;
				
			case 'dryclean':
				$('#' + pid + '_laundry').val('');
				$('#' + pid + '_laundry').prop('disabled', 'disabled');
				
				$('#' + pid + '_pressonly').val('');
				$('#' + pid + '_pressonly').prop('disabled', 'disabled');
				break;
				
			case 'pressonly':
				$('#' + pid + '_laundry').val('');
				$('#' + pid + '_laundry').prop('disabled', 'disabled');
				
				$('#' + pid + '_dryclean').val('');
				$('#' + pid + '_dryclean').prop('disabled', 'disabled');
				break;
		}
	}
	
	$scope.enableInputElement = function(pid) {	
		$('#' + pid + '_laundry').prop('disabled', '');
		$('#' + pid + '_dryclean').prop('disabled', '');
		$('#' + pid + '_pressonly').prop('disabled', '');
		
	}
	
	$scope.express_wash = function() {
		if ($scope.cbk.express_wash) {
			$scope.invoice_info.express_wash = 1;
			$scope.isExpress = 2;
			$('#express-li').addClass('blue-background');
		} else {
			$scope.invoice_info.express_wash = 0;
			$scope.isExpress = 1;
			$('#express-li').removeClass('blue-background');
		}
		
		$scope.calculateTotalPrice();
		$scope.handleTotalPay();
	}
	
	$scope.handleTotalPay = function() {
		var change = ($scope.invoice_info.totalPrice * $scope.isExpress) - $scope.invoice_info.totalPay;
		$('#invoice_remain').html(changeNumberFormat(change) + " VND");
	}
	
	$scope.initSearchCustomerSelect2 = function() {
		$("#customer-invoice").select2({
			ajax : {
				url : 'api/customer/listselect2',
				type : "GET",
				contentType : "application/json",
				delay : 250,
				allowClear: true,
				data : function(params) {
					return {
						textSearch : params.term
					};
				}, 
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
				var result;
				if (data.text && data.text.search('Searching') != -1) {
					return null;
				}
				result =  data.name + " - " + data.address + " - " + data.phone;
				if (data.email) {
					result += " - " + data.email;
				}
				
				return result;
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
	}	
	
	$scope.initSelect2Event = function() {
		$('#customer-invoice').on("select2:select", function(e) {
			var data = e.params.data;
			$scope.customer.name = data.name;
			$scope.customer.phone = data.phone;
			$scope.customer.email = data.email;
			$scope.customer.address = data.address;
			$scope.invoice_info.customer_id = data.id;
			
			$scope.$apply();
		});
	}
	
	$scope.saveInvoice = function() {
		var error_mess = '';
		if (!$scope.validateInvoice()) {
			return;
		}
		
		var product;
		var tbl_products = $('#invoice-cfr-products tbody');
		var tbl_content;
		var wash_type;
		
		tbl_products.html('');
		for (x in $scope.list_product) {
			tbl_content = '';
			product = $scope.list_product[x];
			product_name = product_all[product.pid].vnName + " (" + product_all[product.pid].enName + ")";
			if (product.price_type == 'laundry') {
				wash_type = 'Giặt nước';
			} else if (product.price_type == 'dryclean') {
				wash_type = 'Giặt hấp';
			} else if (product.price_type == 'pressonly') {
				wash_type = 'Chỉ ủi';
			}
			
			tbl_content += '<tr>';
			tbl_content +=    '<td>' + product_name + '</td>';
			tbl_content +=    '<td>' + wash_type + '</td>';
			tbl_content +=    '<td class="cus-number">' + product.qtt + '</td>';
			tbl_content +=    '<td class="cus-number">' + changeNumberFormat(product.unit_price) + '</td>';
			tbl_content += '</tr>';
			
			tbl_products.append(tbl_content);
		}
		
		var tbl_total = $('#invoice-cfr-total');
		var tbl_total_html = '';
		if ($scope.invoice_info.express_wash) {
			tbl_total_html += '<tr> <td style="font-weight: bold">' + ' Giặt nhanh ' + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
		}
		$scope.invoice_info.totalPay = $scope.invoice_info.totalPay ? $scope.invoice_info.totalPay : 0;
		
		tbl_total_html += '<tr> <td style="font-weight: bold">' + 'Tổng cộng' + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice_info.totalPrice * $scope.isExpress) + ' VND </td> </tr>';
		tbl_total_html += '<tr> <td style="font-weight: bold">' + 'Đã thanh toán' + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice_info.totalPay) + ' VND </td> </tr>';
		tbl_total_html += '<tr> <td style="font-weight: bold">' + 'Còn nợ lại' + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice_info.totalPrice * $scope.isExpress - $scope.invoice_info.totalPay) + ' VND </td> </tr>';
		
		tbl_total.html(tbl_total_html);
		
		$('#invoice-cfr-modal').modal({backdrop: "static"});
		$scope.invoice_info.products = $scope.list_product;
		
		console.log($scope.invoice_info);
	}
	
	$scope.validateInvoice = function() {
		var result = true;
		var error_mess = '';
		var invoice = $scope.invoice_info;
		var products = $scope.list_product;
		
		if (products.length <= 0) {
			result = false;
			error_mess += 'Vui lòng chọn món đồ \n';
		}
		if (!invoice.customer_id) {
			result = false;
			error_mess += 'Vui lòng chọn khách hàng\n';
		}
		
		if (!result) {
			BootstrapDialog.show({
				  size: BootstrapDialog.SIZE_SMALL,
		          type: BootstrapDialog.TYPE_DANGER,
		          title: 'Thiếu thông tin',
		          message: error_mess,
		          buttons: [{
		              label: "OK",
		              cssClass: 'btn-warning',
		              action: function(dialog) {
		                  dialog.close();
		              }
		          }]
		      }); 
		}
		
		return result;
	}
	
	$scope.saveInvoiceDB = function() {	
	   $http({
		   method: 'POST',
		   url: 'api/invoice',
		   data : {
			   invoice : $scope.invoice_info		   
		   },
		   params: {
			   _csrf : csrf
		   }
		   
	   })
	   .then(function(response){		   
		   console.log(response);
		  
	   }, function(error){
		   alert("The error occurs when Saving Invoice!!!" + error.statusText);
	   });
		
	}
	
	// Call function when page loaded
	
   
});