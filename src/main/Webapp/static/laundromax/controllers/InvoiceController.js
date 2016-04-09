mainApp.controller('InvoiceController', function($scope) {
//	scope variable
	$scope.search = {};
	$scope.invoice_status = {
		NEW: 1,
		SENT_PARTNER: 2,
		RECEIVE_PARTNER: 3,
		DELIVERY: 4
	};
	
	
	$scope.doSearch = function() {
		console.log($scope.search);
		$('#list-invoice').bootstrapTable('refresh', {
			silent: true
		});
	}
	
	$scope.searchInvoiceChange = function() {
		if ($scope.search.type == 'status') {
			$('#invoice-search-input').hide();
			$('#invoice-status-search-div').show();
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
				width : '50px'
			},{
				field: 'name',
				title : 'Cus name',
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'totalPrice',
				title : 'Total price',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'totalPay',
				title : 'Total pay',
				align : 'left',
				valign : 'middle',
				sortable : false
			}, {
				field : 'note',
				title : 'Note',
				align : 'left',
				valign : 'middle',
				sortable : false			
			}, {
				field : 'lastStatus',
				title : 'Status',
				align : 'center',
				valign : 'middle',
				sortable : true,
				formatter: statusFormatter
			}, {
				field : 'dateCreate',
				title : 'Date create',
				align : 'right',
				valign : 'middle',
				sortable : true,
				formatter: dateFormatter
			}]
		
			}).on('load-success.bs.table', function(e, data) {
				$scope.data = data.rows;
		});
    }
    
    function statusFormatter(value, row, index) {
    	var result = '';
    	switch (value) {
	    	case $scope.invoice_status.NEW:
	    		result = '<span style="color: red; background-color: blue" class="badge"> Mới </span>';
	    		break;
	    		
	    	case $scope.invoice_status.SENT_PARTNER:
	    		result = '<span style="color: red; background-color: blue" class="badge"> Sent partner </span>';
	    		break;
	    		
	    	case $scope.invoice_status.RECEIVE_PARTNER:
	    		result = '<span style="color: red; background-color: blue" class="badge"> Receive partner </span>';
	    		break;
	    		
	    	case $scope.invoice_status.DELIVERY:
	    		result = '<span style="color: red; background-color: blue" class="badge"> Delivery </span>';
	    		break;	    		
    	}
    	
    	return result;
    }
    
    function dateFormatter(value, row, index) {
    	var date = moment(value);
    	return date.format("DD-MM-YYYY, HH:mm:ss");
    }
   
    function queryParams(params) {	   
    	$scope.search.type = !$scope.search.type ? "" : $scope.search.type;
    	$scope.search.input = !$scope.search.input ? "" : $scope.search.input;
	   
    	params.typeSearch = $scope.search.type;
    	params.textSearch = $scope.search.input;
    	params.from = $('#from-timepicker').val();
    	var xx = moment(params.from);
    	var ff = xx.unix();
    	var yy = moment.utc(params.from);
    	var zz = yy.unix();
    	params.to = $('#to-timepicker').val();
	   
    	console.log(moment.locale()); 
    	
    	return params;
    	console.log(params);
    }
    
    
    
});