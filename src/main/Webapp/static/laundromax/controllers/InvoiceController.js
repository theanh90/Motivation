mainApp.controller('InvoiceController', function($scope) {
//	scope variable
	$scope.search = {};
	
	
	$scope.doSearch = function() {
		$('#list-invoice').bootstrapTable('refresh', {
			silent: true
		});
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
				sortable : true
			}, {
				field : 'totalPay',
				title : 'Total pay',
				align : 'left',
				valign : 'middle',
				sortable : true
			}, {
				field : 'note',
				title : 'Note',
				align : 'left',
				valign : 'middle',
				sortable : false			
			}, {
				field : 'lastStatus',
				title : 'Status',
				align : 'right',
				valign : 'middle',
				sortable : false
			}, {
				field : 'dateCreate',
				title : 'Date create',
				align : 'right',
				valign : 'middle',
				sortable : false,
				formatter: dateFormatter
			}]
		
			}).on('load-success.bs.table', function(e, data) {
				$scope.data = data.rows;
		});
    }
    
    function dateFormatter(value, row, index) {
    	var date = moment(value);
    	return date.format("DD-MM-YYYY, hh:mm:ss");
    }
   
    function queryParams(params) {	   
    	$scope.search.type = !$scope.search.type ? "" : $scope.search.type;
    	$scope.search.input = !$scope.search.input ? "" : $scope.search.input;
	   
    	params.typeSearch = $scope.search.type;
    	params.textSearch = $scope.search.input;
	   
    	return params;
    }
});