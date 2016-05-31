mainApp.controller('AddInvoiceController', function($scope, $http) {
	var csrf = $('#token').val();
	
	$scope.list_product = new Array();
	$scope.invoice_info = {
			express_wash : 0,
			totalPay : null,
			note : null,
			vat : 0,
			discount : null,
			totalCalculated: 0
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
			   if (response.data.status == 'ERROR') {
				   var title = lang_confirm;
				   var mess = lang_error_get;
				   var type = 'danger';
				   var size = 'small';
				   var action = function(){location.href = '';};
				   
				   showMessageWithAction(title, mess, type, action, size);
			   } else {
				   var tbody = $('#list-product-tbl tbody');
				   var row;
				   var data;			   

				   // global variable
				   product_all = {};
				   
				   for (var i=0; i<response.data.rows.length; i++) {
					   data = response.data.rows[i];
					   product_all[data.pid] = data;
					   
					   row = '';
					   
					   row += '<tr qtt-value="" pid="' + data.pid + '">';
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
			   }
		   }, function(error){
			   alert("The error occurs when Saving/Update Product!!!" + error.statusText);
		   });
	}
	
	changeQTT = function(element, price_type) {
		var row = $(element).closest('tr');
		var pid = row.attr('pid');
		var qtt = $(element).val();
		
		row_qtt = $('#' + pid + '_laundry').val() + $('#' + pid + '_dryclean').val() + $('#' + pid + '_pressonly').val(); 
		
		if (qtt > 0) {
			// disable 2 other input
			row.addClass('selected-pro-row');			
//			$scope.disableInputElement(pid, price_type);
		} else if (qtt == 0) {
			// enable 2 other input
			$('#' + pid + price_type).val('');
			if (row_qtt == 0) {
				row.removeClass('selected-pro-row');				
			}
//			$scope.enableInputElement(pid);
		} else {
			$(element).val(0);
			return false;
		}
		
		// remove old value to avoid duplicate product id
		for (var i=0; i<$scope.list_product.length; i++) {
			if ($scope.list_product[i].pid == pid && $scope.list_product[i].price_type == price_type) {
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
		$scope.invoice_info.totalCalculated = ((result * $scope.isExpress)/100)*(100-$scope.invoice_info.discount);
		
		if ($scope.invoice_info.vat) {
			$scope.invoice_info.totalCalculated = ($scope.invoice_info.totalCalculated/100)*110;
		}
		
		$scope.invoice_info.totalCalculated = Math.floor($scope.invoice_info.totalCalculated);
		
		$('#amount-total').html(changeNumberFormat($scope.invoice_info.totalCalculated) + " VND");
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
			$scope.isExpress = 1.5;
			$('#express-li').addClass('blue-background');
		} else {
			$scope.invoice_info.express_wash = 0;
			$scope.isExpress = 1;
			$('#express-li').removeClass('blue-background');
		}
		
		$scope.calculateTotalPrice();
		$scope.handleTotalPay();
	}
	
	$scope.changeVAT = function() {
		if ($scope.cbk.vat) {
			$('#vat-li').addClass('blue-background');
			$scope.invoice_info.vat = 1;
		} else {
			$('#vat-li').removeClass('blue-background');
			$scope.invoice_info.vat = 0;
		}
		$scope.calculateTotalPrice();
	}
	
	$scope.changeDiscount = function() {
		if ($scope.invoice_info.discount) {
			$('#discount-li').addClass('blue-background');
		} else {
			$('#discount-li').removeClass('blue-background');
			$scope.invoice_info.discount = 0;
		}
		
		$scope.calculateTotalPrice();
	}
	
	$scope.handleTotalPay = function() {
		if ($scope.invoice_info.totalPay > $scope.invoice_info.totalCalculated) {
			$scope.invoice_info.totalPay = $scope.invoice_info.totalCalculated;
		}
		
		var change = ($scope.invoice_info.totalCalculated) - $scope.invoice_info.totalPay;
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
			placeholder: lang_input_holder
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
				wash_type = lang_laundry;
			} else if (product.price_type == 'dryclean') {
				wash_type = lang_dryclean;
			} else if (product.price_type == 'pressonly') {
				wash_type = lang_pressonly;
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
			tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_express + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
		}
		if ($scope.invoice_info.discount) {
			tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_discount + '</td> <td class="cus-number">' + $scope.invoice_info.discount + '% </td> </tr>';
		}
		if ($scope.invoice_info.vat) {
			tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_vat + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
		}
		
		$scope.invoice_info.totalPay = $scope.invoice_info.totalPay ? $scope.invoice_info.totalPay : 0;
		
		tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_total + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice_info.totalCalculated) + ' VND </td> </tr>';
		tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_paid_upfront + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice_info.totalPay) + ' VND </td> </tr>';
		tbl_total_html += '<tr> <td style="font-weight: bold">' + lang_due_amount + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice_info.totalCalculated - $scope.invoice_info.totalPay) + ' VND </td> </tr>';
		
		tbl_total.html(tbl_total_html);
		
		$('#invoice-cfr-modal').modal({backdrop: "static"});
		$scope.invoice_info.products = $scope.list_product;
		
	}
	
	$scope.validateInvoice = function() {
		var result = true;
		var error_mess = '';
		var invoice = $scope.invoice_info;
		var products = $scope.list_product;
		
		if (products.length <= 0) {
			result = false;
			error_mess += lang_valid_select_item + '\n';
		}
		if (!invoice.customer_id) {
			result = false;
			error_mess += lang_valid_select_customer;
		}
		
		if (!result) {
			BootstrapDialog.show({
				  size: BootstrapDialog.SIZE_SMALL,
		          type: BootstrapDialog.TYPE_DANGER,
		          title: lang_validate_missing,
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
		   var action;
		   var size = 'small';	
		   if (response.data.returnStatus == 'SUCCESS') {
			   var mess = lang_add_success;
			   var title = lang_confirm;
			   var type = 'success';
			   action = function(dialog) {
				   location.href = url_common + '#/invoice/viewinvoice/' + response.data.data;
				   dialog.close();
			   };
		   } else {
			   var mess = lang_add_fail;
			   var title = lang_confirm;
			   var type = 'danger';
			   action = function() {
				   location.href = url_common + '#/invoice/';
				   dialog.close();
			   };
		   }
   		   
		   showMessageWithAction(title, mess, type, action, size);
		  
	   }, function(error){
		   alert("The error occurs when Saving Invoice!!!" + error.statusText);
	   });
		
	}
	
	// Call function when page loaded
	
   
});