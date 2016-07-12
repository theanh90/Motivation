mainApp.controller('ViewInvoiceController', function($scope, $http, $route, $compile) {
	var csrf = $('#token').val();
	$scope.pay = {};
	$scope.invoice_id = $route.current.params.id;
	
	$scope.getInvoice = function() {
		$http({
			   method: 'GET',
			   url: 'api/invoice/getviewbyid?id=' + $scope.invoice_id		   
		   })
		   .then(function(response){
		   		if (response.data.returnStatus == 'SUCCESS') {
				  	$scope.invoice = response.data.data;
				  	$scope.total_item = 0;
				  	console.log($scope.invoice);
				  	var product;
					var tbl_products = $('#invoice-view-tbl tbody');
					var tbl_content;
					var wash_type;
					
					tbl_products.html('');
					for (x in $scope.invoice) {						
						tbl_content = '';
						product = $scope.invoice[x];
						$scope.total_item += product.quantity;
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
						tbl_total_html += '<tr> <td class="c-bold">' + lang_express + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
					}
					if ($scope.invoice[0].discount) {
						tbl_total_html += '<tr> <td class="c-bold">' + lang_discount + '</td> <td class="cus-number">' + $scope.invoice[0].discount + '% </td> </tr>';
					}
					if ($scope.invoice[0].vat) {
						tbl_total_html += '<tr> <td class="c-bold">' + lang_vat + '</td> <td class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
					}
										
					tbl_total_html += '<tr> <td class="c-bold">' + lang_total + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice) + ' VND </td> </tr>';
					tbl_total_html += '<tr> <td class="c-bold">' + lang_paid_upfront + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPay) + ' VND </td> </tr>';
					tbl_total_html += '<tr> <td class="c-bold">' + lang_due_amount + '</td> <td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay) + ' VND </td> </tr>';
					
					if ($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay > 0) {
						tbl_total_html += '<tr> <td colspan="2" class="c-bold">' + '<button ng-click="doPay()" type="button" class="btn btn-success">Thanh toán</button>' + '</td> </tr>';
					}
					
					tbl_total.html(tbl_total_html);
					$('#h-invoiceid').html(($('#h-invoiceid').html() + ' #' + $scope.invoice[0].id.inId));
					$('#invoice-note').html('<span class="c-bold">' + lang_note + ': </span>' + ($scope.invoice[0].invoiceNote ? $scope.invoice[0].invoiceNote : ''));
					
					// for customer information
					$('#c-invoice-view-name').html($scope.invoice[0].name);
					$('#c-invoice-view-address').html($scope.invoice[0].address);
					$('#c-invoice-view-phone').html($scope.invoice[0].phone);
					$('#c-invoice-view-email').html($scope.invoice[0].email);
					
					// for current invoice status
					$('#current-status').html($scope.renderInvoiceStatusColor($scope.invoice[0].lastStatus));
					
					// for change status
					if ($scope.invoice[0].lastStatus > 0 && $scope.invoice[0].lastStatus < 5) {
						$scope.renderChangeStatusButton($scope.invoice[0].lastStatus);
					} else {
						$('.c-fg-change-status').remove();
					}
					
					// for delete New_Invoice
					if ($scope.invoice[0].lastStatus == 1) {
						var delete_element = $('#c-delete-span');
						var html = 	'<div class="col-sm-4">' +
										'<div class="form-group c-fg-change-status">' +
											'<a class="w3-btn w3-margin-bottom" style="background-color: red" ng-click="confirmDelete()">' + lang_invoice_delete_text + '</a>' +
										'</div>' +
									'</div>';
						delete_element.html(html);
					}
					
					// for send request cancel with Confirmed_invoice to Admin
					if ($scope.invoice[0].lastStatus == 2) {
						var request_element = $('#c-request-cancel-span');
						var html = 	'<div class="col-sm-4">' +
										'<div class="form-group c-fg-change-status">' +
											'<a class="w3-btn w3-margin-bottom" style="background-color: black" ng-click="confirmRequestCancel()">' + lang_invoice_request_text + '</a>' +
										'</div>' +
									'</div>';
						request_element.html(html);
					}
					
					// for Partner denied items and returned it.
//					if ($scope.invoice[0].lastStatus == 3) {
//						var request_element = $('#c-partner-deny-span');
//						var html = 	'<div class="col-sm-4">' +
//										'<div class="form-group c-fg-change-status">' +
//											'<a class="w3-btn w3-margin-bottom" style="background-color: red" ng-click="partnerDenyDialog()">' + lang_partner_deny + '</a>' +
//										'</div>' +
//									'</div>';
//						request_element.html(html);
//					}
					
					// for print bill
					if ($scope.invoice[0].lastStatus >= 2) {
						var print_element = $('#c-print-span');
						var html = 	'<div class="col-sm-4">' +
										'<div class="form-group c-fg-change-status">' +
											'<a id="c-print-action" class="w3-btn w3-margin-bottom w3-print" style="background-color: black">' + lang_invoice_printbill + '</a>' +
										'</div>' +
									'</div>';
						print_element.html(html);
					}
					$('#c-print-action').webuiPopover ({
						title: '<div>' + lang_invoice_choose_print + '</div>',
						content:'<div id="c-print-popover">' +
									'<p onclick=printInvoice(0)><a>' + lang_invoice_choose_print_customer + '</a></p>' +
									'<p onclick=printInvoice(1)><a>' + lang_invoice_choose_print_partner + '</a></p>' +
								'</div>',
						closeable: true
					});
					
					// compile with Angular to run function confirmDelete()
					$compile(delete_element)($scope);
					$compile(request_element)($scope);
					$compile(tbl_total)($scope);
					
			  } else {
				  var mess = 'Error when get Invoice detail!!';
				  var type = 'ERROR';
				  showConfirmModal(mess, type);				  
			  }
			  			  
		   }, function(error){
			   alert("The error occurs when get Invoice details!!!" + error.statusText);
		   });
	}
	
	$scope.partnerDenyDialog = function() {
		BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: lang_common_confirm,
           message: lang_partner_deny_confirm,
           buttons: [{
               label: lang_common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
                   return $scope.partnerDeny(dialog);
               }
               
           }, {
               label: lang_common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       });
	}
	
	$scope.partnerDeny = function(dialog) {
		dialog.close();
		window.location.href = url_common + '#invoice/addinvoice?customer=' + 
			$scope.invoice[0].cid + '&oldinvoice=' + $scope.invoice_id +
			'&temp=' + csrf;
		
	}
	
	$scope.doPay = function() {
		var mess = 	'<table class="table bootstrap-table c-dopay">' +
						'<tr class="c-firstrow"><td>' + lang_total + ' </td><td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice) + '</td></tr>' +
						'<tr><td>' + lang_paid_upfront + ' </td><td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPay) + '</td></tr>' +
						'<tr><td>' + 'Nợ cũ' + ' </td><td class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay) + '</td></tr>' +
						'<tr><td>' + 'Thanh toán' + ' </td><td class="cus-number">' + '<input min="0" onchange="handleDoPay(this)" class="cus-number" type="number" />' + '</td></tr>' +
						'<tr><td>' + 'Còn lại' + ' </td><td id="pay-remain" class="cus-number">' + '' + '</td></tr>' +
					'</table>';
		
		BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_DEFAULT,
           title: lang_common_confirm,
           message: mess,
           buttons: [{
               label: lang_common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
            	   confirmPay(dialog);
//                   return $scope.doPaySubmmit(dialog);
               }
               
           }, {
               label: lang_common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	
	}
	
   confirmPay = function(dialog) {
		if (!$scope.pay.newpay || $scope.pay.newpay <= 0) {
			alert('Xin nhập số tiền khách trả');
			return;
		}
			
	   dialog.close();
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: lang_common_confirm,
           message: 'Bạn có chắc chắn với số tiền: ' + changeNumberFormat($scope.pay.newpay) + ' VND',
           buttons: [{
               label: lang_common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
            	   $scope.doPaySubmmit(dialog);
               }
           }, {
               label: lang_common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
            	   $scope.pay.newpay = 0;
                   dialog.close();
               }
           }]
       }); 	   

   }
	
	handleDoPay = function(element) {
		var value = $(element).val();
		if (value > ($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay)) {
			value = $scope.invoice[0].totalPrice - $scope.invoice[0].totalPay;
			$(element).val(value);
		}
		$scope.pay.newpay = value;
		
		var pay_remain = ($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay) - value;		
		var new_pay_remain = $('#pay-remain');
		
		new_pay_remain.html(changeNumberFormat(pay_remain));
	}
	
	$scope.doPaySubmmit = function(dialog) {			
		$http({
			   method: 'PUT',
			   url: 'api/invoice/pay',
			   data : {
				   invoiceId : $scope.invoice[0].id.inId,
				   money : $scope.pay.newpay
			   },
			   params: {
				   _csrf : csrf
			   }
			   
		   })
		   .then(function(response){
			   dialog.close();
			   if (response.data.returnStatus == 'SUCCESS') {
				   var mess = 'Thanh toán thành công';
				   var type = 'SUCCESS';
				   showConfirmModal(mess, type, $scope.reload);
			   } else {
				   var mess = 'Thanh toán thất bại!!';
				   var type = 'ERROR';
				   showConfirmModal(mess, type);				   
			   }
			  
		   }, function(error){
			   alert("The error occurs when Paying this Invoice!!!" + error.statusText);
	   });
	}
	
	printInvoice = function(type) {
		var content;
		$scope.print_window = window.open('', 'Print Bill', 'height=700, width=500, left=300');

		if (type === 0) { // customer bill
			content = $scope.getPrintCustomer();				
		} else {
			content = $scope.getPrintPartner();
		}
		
		if (!$scope.print_window.document.body.innerHTML) {
			$scope.print_window.document.write(content);
		}

		$scope.print_window.print();
		$('#c-print-action').webuiPopover('hide');
		$scope.print_window.close();

        return true;
	}
	
	$scope.getPrintCustomer = function() {
		$('.p-total-delete').show();
		$('.p-mark-partner').hide();
		var first_row = $scope.invoice[0];
		var date = moment(first_row.datecreate);
		var invoice_detail = $('.p-invoice-detail table tbody');
		var table_content = '';
		
		$('#p-invoice-id-span').html(first_row.id.inId);
		$('.p-invoice-cname').html('<b>' + first_row.name.toUpperCase() + '</b>');
		$('.p-invoice-cadd').html(first_row.address);
		$('.p-invoice-cphone').html(first_row.phone);
		$('.p-invoice-date').html(date.format("DD/MM/YYYY - HH:mm"));

		// render invoice detail
		for (x in $scope.invoice) {
			tbl_content = '';
			product = $scope.invoice[x];
			product_name = product.vnName + " - " + product.enName;
			if (product.typePrice == 'laundry') {
				wash_type = 'Giặt nước - Laundry';
			} else if (product.typePrice == 'dryclean') {
				wash_type = 'Giặt hấp - Dryclean';
			} else if (product.typePrice == 'pressonly') {
				wash_type = 'Chỉ ủi - PressOnly'
			}
			
			if (x == $scope.invoice.length-1) {
				tbl_content += '<tr class="c-bottom">';
			} else {
				tbl_content += '<tr>';	
			}
			tbl_content +=    '<td>' + product_name + '</td>';
			tbl_content +=    '<td>' + wash_type + '</td>';
			tbl_content +=    '<td class="cus-number">' + product.quantity + '</td>';
			tbl_content +=    '<td class="cus-number">' + changeNumberFormat(product.unitPrice) + '</td>';
			tbl_content += '</tr>';
			
			table_content += (tbl_content);
		}
		
		table_content += '<tr> <td colspan="2">' + '<b>Số món</b> - Items count' + 
				'</td> <td class="cus-number">' + $scope.total_item + '</td> </tr>';
		
		if ($scope.invoice[0].isExpress) {
			table_content += '<tr> <td colspan="2">' + '<b>Giặt nhanh</b> - Express' + 
				'</td> <td colspan="2" class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
		}
		if ($scope.invoice[0].discount) {
			table_content += '<tr> <td colspan="2">' + '<b>Giảm giá</b> - Discount' + '</td> <td colspan="2" class="cus-number">' + 
				$scope.invoice[0].discount + '% </td> </tr>';
		}
		if ($scope.invoice[0].vat) {
			table_content += '<tr> <td colspan="2">' + '<b>VAT</b>' + 
				'</td> <td colspan="2" class="cus-number"><i class="fa fa-check-square-o"></td> </tr>';
		}
							
		table_content += '<tr> <td colspan="2">' + '<b>Tổng cộng</b> - Total' + '</td> <td colspan="2" class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice) + '</td> </tr>';
		table_content += '<tr> <td colspan="2">' + '<b>Đã trả</b> - Pay Upfront' + '</td> <td colspan="2" class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPay) + '</td> </tr>';
		table_content += '<tr> <td colspan="2">' + '<b>Còn nợ</b> - Due Amount' + '</td> <td colspan="2" class="cus-number">' + changeNumberFormat($scope.invoice[0].totalPrice - $scope.invoice[0].totalPay) + '</td> </tr>';
		
		invoice_detail.html(table_content);
		
		var content = $('.c-print-holder').html();
		
		return content;
	}
	
	$scope.getPrintPartner = function() {
		$('.p-total-delete').hide();
		$('.p-mark-partner').show();
		var first_row = $scope.invoice[0];
		var date = moment(first_row.datecreate);
		var invoice_detail = $('.p-invoice-detail table tbody');
		var table_content = '';
		
		$('#p-invoice-id-span').html(first_row.id.inId);
		$('.p-invoice-cname').html('<b>' + first_row.name.toUpperCase() + '</b>');
		$('.p-invoice-cadd').html(first_row.address);
		$('.p-invoice-date').html(date.format("DD/MM/YYYY - HH:mm"));
		$('.p-mark-partner').children('p').html($scope.invoice[0].invoiceNote);

		// render invoice detail
		for (x in $scope.invoice) {
			tbl_content = '';
			product = $scope.invoice[x];
			product_name = product.vnName + " - " + product.enName;
			if (product.typePrice == 'laundry') {
				wash_type = 'Giặt nước - Laundry';
			} else if (product.typePrice == 'dryclean') {
				wash_type = 'Giặt hấp - Dryclean';
			} else if (product.typePrice == 'pressonly') {
				wash_type = 'Chỉ ủi - PressOnly'
			}
			
			if (x == $scope.invoice.length-1) {
				tbl_content += '<tr class="c-bottom">';
			} else {
				tbl_content += '<tr>';	
			}
			tbl_content +=    '<td>' + product_name + '</td>';
			tbl_content +=    '<td>' + wash_type + '</td>';
			tbl_content +=    '<td class="cus-number">' + product.quantity + '</td>';
			tbl_content +=    '<td class="cus-number">' + '' + '</td>';
			tbl_content += '</tr>';
			
			table_content += (tbl_content);
		}
		table_content += '<tr> <td colspan="2">' + '<b>Số món</b> - Items count' + 
				'</td> <td class="cus-number">' + $scope.total_item + '</td> </tr>';
		
		invoice_detail.html(table_content);
		
		var content = $('.c-print-holder').html();
		
		return content;
	}
	
	$scope.changeInvoiceStatus = function(dialog) {
		var current_invoice_id = $scope.invoice[0].id.inId;
		$http({
			   method: 'PUT',
			   url: 'api/invoice/status',
			   data : {
				   invoiceId : current_invoice_id
			   },
			   params: {
				   _csrf : csrf
			   }
			   
		   })
		   .then(function(response){
			   dialog.close();
			   if (response.data.returnStatus == 'SUCCESS') {
				   var mess = lang_invoice_change_success;
				   var type = 'SUCCESS';
				   showConfirmModal(mess, type, $scope.reload);
			   } else {
				   var mess = 'Error when Changing Invoice status!!';
				   var type = 'ERROR';
				   showConfirmModal(mess, type);				   
			   }
			  
		   }, function(error){
			   alert("The error occurs when Changing Invoice status!!!" + error.statusText);
	   });
	}
	
	$scope.reload = function() {
		location.reload();
	}
	
	$scope.goToInvoiceLink = function(dialog) {
		dialog.close();
		location.href = url_common + '#/invoice/';
	}
	
	$scope.confirmChange = function() {
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: lang_common_confirm,
           message: lang_invoice_confirm_changestatus,
           buttons: [{
               label: lang_common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
                   return $scope.changeInvoiceStatus(dialog);
               }
               
           }, {
               label: lang_common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	   

    }
	
	$scope.confirmDelete = function() {
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: lang_common_confirm,
           message: lang_invoice_confirm_delete,
           buttons: [{
               label: lang_common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
                   return $scope.deleteInvoice(dialog);
               }
               
           }, {
               label: lang_common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	   

    }
	
	$scope.confirmRequestCancel = function() {
	   BootstrapDialog.show({
		   size: BootstrapDialog.SIZE_SMALL,
           type: BootstrapDialog.TYPE_WARNING,
           title: lang_common_confirm,
           message: lang_invoice_confirm_request,
           buttons: [{
               label: lang_common_continue,
               cssClass: 'btn-success',
               action: function(dialog) {
                   return $scope.setInvoiceStatusToRequest(dialog);
               }
               
           }, {
               label: lang_common_cancel,
               cssClass: 'btn-danger',
               action: function(dialog) {
                   dialog.close();
               }
           }]
       }); 	   

    }
	
	$scope.setInvoiceStatusToRequest = function(dialog) {
		var current_invoice_id = $scope.invoice[0].id.inId;
		$http({
			   method: 'PUT',
			   url: 'api/invoice/torequest?invoiceId=' + current_invoice_id,
			   params: {
				   _csrf : csrf
			   }
			   
		   })
		   .then(function(response){
			   dialog.close();
			   if (response.data.returnStatus == 'SUCCESS') {
				   var mess = lang_invoice_sendrequest_success;
				   var type = 'SUCCESS';
				   showConfirmModal(mess, type, $scope.goToInvoiceLink);
			   } else {
				   var mess = 'Error when send request cancel!!';
				   var type = 'ERROR';
				   showConfirmModal(mess, type);				   
			   }
			  
		   }, function(error){
			   alert("The error occurs when send request cancel!!!" + error.statusText);
	   });
	}
	
	$scope.deleteInvoice = function(dialog) {
		var current_invoice_id = $scope.invoice[0].id.inId;
		$http({
			   method: 'DELETE',
			   url: 'api/invoice/delete?invoiceId=' + current_invoice_id,
			   params: {
				   _csrf : csrf
			   }
			   
		   })
		   .then(function(response){
			   dialog.close();
			   if (response.data.returnStatus == 'SUCCESS') {
				   var mess = lang_invoice_remove_success;
				   var type = 'SUCCESS';
				   showConfirmModal(mess, type, $scope.goToInvoiceLink);
			   } else {
				   var mess = 'Error when delete Invoice!!';
				   var type = 'ERROR';
				   showConfirmModal(mess, type);				   
			   }
			  
		   }, function(error){
			   alert("The error occurs when delete Invoice!!!" + error.statusText);
	   });
	}
	
	$scope.renderChangeStatusButton = function(status) {
		if (status <= 0 || status >= 5)
			return;		
		var element = $('#change-status');
		var content = '';
		
		switch(status) {
			case 1:
				content += lang_common_status_confirmed;
				break;
				
			case 2:
				content += lang_common_status_sent;
				break;
				
			case 3:
				content += lang_common_status_receive;
				break;
				
			case 4:
				content += lang_common_status_delivery;
				break;
		}
		
		element.html(content);
		
	}
	
	$scope.renderInvoiceStatusColor = function(status) {
		var result = '';
		
		switch(status) {
			case -1:
				result += '<div class="alert c-status-request" role="alert">' + lang_common_status_requestcancel + '</div>';
				break;
				
			case 0:
				result += '<div class="alert c-status-cancel" role="alert">' + lang_common_status_cancel + '</div>';
				break;
				
			case 1:
				result += '<div class="alert c-status-new" role="alert">' + lang_common_status_new + '</div>';
				break;
				
			case 2:
				result += '<div class="alert c-status-confirm" role="alert">' + lang_common_status_confirmed + '</div>';				
				break;
				
			case 3:
				result += '<div class="alert c-status-sent" role="alert">' + lang_common_status_sent + '</div>';
				break;
				
			case 4:
				result += '<div class="alert c-status-receive" role="alert">' + lang_common_status_receive + '</div>';
				break;
				
			case 5:
				result += '<div class="alert c-status-delivery" role="alert">' + lang_common_status_delivery + '</div>';
				break;		
		}
		
		return result;
	}
	
	// call function on loaded
	//	$scope.getInvoice();
});