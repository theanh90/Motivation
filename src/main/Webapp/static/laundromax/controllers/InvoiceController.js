mainApp.controller('InvoiceController', function($scope) {
//	scope variable
	$scope.search = {};
	$scope.invoice_status = {
		NEW: 1,
		CONFIRMED: 2,
		SENT_PARTNER: 3,
		RECEIVE_PARTNER: 4,
		DELIVERY: 5,
		REQUEST_CANCEL: -1,
		CANCEL: 0
	};
	
	
	$scope.doSearch = function() {
		$('#list-invoice').bootstrapTable('refresh', {
			silent: true
		});
	}
	
	$scope.searchInvoiceChange = function() {
		if ($scope.search.type == 'status') {
			$('#invoice-search-input').hide();
			$('#invoice-status-search-div').show();
			$scope.search.status_type = 1;
		} else {
			$('#invoice-search-input').show();
			$('#invoice-status-search-div').hide();
		}
	}
   
    $scope.getListProduct = function() {
		$('#list-invoice').bootstrapTable({
			method : 'get',
			url : 'api/invoice/list',
			cache : false,
			class : 'table table-hover',
			striped : true,
			pagination : true,
			sortName: 'inId',
			sortOrder: 'desc',
			pageSize : 20,
			pageList : [ 10, 20, 50, 100 ],
			sidePagination : 'server',
			minimumCountColumns : 2,
			clickToSelect : false,
			showRefresh: true,
			queryParams : queryParams,
			columns : [ {
				field: 'inId',
				title : '#',
				align : 'center',
				valign : 'center',
				sortable : true,
				width : '50px',
				formatter : invoiceIdFormatter
			},{
				field: 'name',
				title : lang_customer,
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'note',
				title : lang_note,
				align : 'left',
				valign : 'middle',
				sortable : false	
			}, {
				field : 'totalPrice',
				title : lang_totalPrice,
				align : 'right',
				valign : 'middle',
				sortable : true,
				formatter : numberFormatter
			}, {
				field : 'totalPay',
				title : lang_totalPay,
				align : 'right',
				valign : 'middle',
				sortable : true,
				formatter : numberFormatter
			}, {
				field : 'dueAmount',
				title : lang_dueAmount,
				align : 'right',
				valign : 'middle',
				sortable : true,
				formatter : numberFormatter,
				cellStyle : dueAmountCellStyle
			}, {
				field : 'lastStatus',
				title : lang_status,
				align : 'center',
				valign : 'middle',
				sortable : true,
				cellStyle: statusCellStyle,
				formatter: statusFormatter
			}, {
				field : 'dateCreate',
				title : lang_createdDate,
				align : 'right',
				valign : 'middle',
				sortable : true,
				formatter: dateFormatter
			}]
		
			}).on('load-success.bs.table', function(e, data) {
				$scope.data = data.rows;
		});
    }
    
    function statusCellStyle(value, row, index) {
    	var row_class = '';
    	
    	switch (row.lastStatus) {
	    	case $scope.invoice_status.NEW:
	    		row_class = 'alert c-status-new'; 
	    		break;
	
	    	case $scope.invoice_status.CONFIRMED:
	    		row_class = 'c-status-confirm';
	    		break;
	    		
	    	case $scope.invoice_status.SENT_PARTNER:
	    		row_class = 'c-status-sent';
	    		break;
	    		
	    	case $scope.invoice_status.RECEIVE_PARTNER:
	    		row_class = 'c-status-receive';
	    		break;
	    		
	    	case $scope.invoice_status.DELIVERY:
	    		row_class = 'c-status-delivery';
	    		break;
	    		
	    	case $scope.invoice_status.REQUEST_CANCEL:
	    		row_class = 'c-status-request';
	    		break;
	    		
	    	case $scope.invoice_status.CANCEL:
	    		row_class = 'c-status-cancel';
	    		break;	  	    		
    	}
    	
    	return {classes: row_class}
    }
    
    function invoiceIdFormatter(value, row, index) {
    	var curr_url = window.location.href;
    	return '<a href="' + curr_url + '/viewinvoice/' +value + '">' + value + '</a>';
    }
    
    function dueAmountCellStyle(value, row, index) {
    	if (value == 0) {
    		return {
        		css: {"color": "blue"}
    	    }; 
    	}
    	return value;
    }
    
    function dueAmountFormatter(value, row, index) {
    	var result = row.totalPrice - row.totalPay;
    	if (result == 0) {
    		return changeNumberFormat(result);
    	} else {
    		return changeNumberFormat(result);
    	}
    	
    }
    
    function statusFormatter(value, row, index) {
    	var result = '';
    	switch (value) {
	    	case $scope.invoice_status.NEW:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_new + ' </span>';
	    		break;

	    	case $scope.invoice_status.CONFIRMED:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_confirmed + ' </span>';
	    		break;
	    		
	    	case $scope.invoice_status.SENT_PARTNER:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_sent + ' </span>';
	    		break;
	    		
	    	case $scope.invoice_status.RECEIVE_PARTNER:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_receive + ' </span>';
	    		break;
	    		
	    	case $scope.invoice_status.DELIVERY:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_delivery + ' </span>';
	    		break;
	    		
	    	case $scope.invoice_status.REQUEST_CANCEL:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_requestcancel + ' </span>';
	    		break;
	    		
	    	case $scope.invoice_status.CANCEL:
	    		result = '<span class="badge" style="color: #337ab7; background-color: #fff"> ' + lang_common_status_cancel + ' </span>';
	    		break;		
	    		
    	}
    	
    	return result;
    }
    
    function dateFormatter(value, row, index) {
    	var date = moment(value);
    	return date.format("DD/MM/YYYY - HH:mm:ss");
    }
    
    function numberFormatter(value, row, index) {
    	return changeNumberFormat(value);
    }
   
    function queryParams(params) {	   
    	$scope.search.type = !$scope.search.type ? "all" : $scope.search.type;
    	$scope.search.input = !$scope.search.input ? "" : $scope.search.input;
	   
    	params.typeSearch = $scope.search.type;
    	params.textSearch = $scope.search.input;
    	
    	var from_time = $('#from-timepicker').val();
    	var to_time = $('#to-timepicker').val();
    	
    	if (from_time) {
        	params.from = moment.utc(from_time, 'DD/MM/YYYY').unix();  
    	} 
    	if (to_time) {
        	params.to = moment.utc(to_time, 'DD/MM/YYYY').unix();  
    	}
    	params.statusType = $scope.search.status_type;
    	
    	return params;
    }
    
    
    
});