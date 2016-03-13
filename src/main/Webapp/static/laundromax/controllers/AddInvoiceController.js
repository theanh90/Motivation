mainApp.controller('AddInvoiceController', function($scope, $http) {
	var csrf = $('#token').val();
	
	$scope.list_product = new Array();
	
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
			   
			   for (var i=0; i<response.data.rows.length; i++) {
				   data = response.data.rows[i];
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
			return;
		}
	
		$scope.list_product.push({pid: pid, price_type: price_type, qtt: qtt});
		
		// display amout for each product
		$scope.displayAmout(pid, price_type, qtt);
		
		
		console.log($scope.list_product);
	}
	
	$scope.displayAmout = function(pid, price_type, qtt) {
		var amount_element;
		var price_element;
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
	
	// Call function when page loaded
	$scope.addInvoice();
   
});