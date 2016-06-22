$ ->
	$('#datatable-responsive').DataTable
		"searching": false
		"processing": true
		"serverSide": true
		"ordering": false
		"ajax": $.fn.dataTable.pipeline(
			url: $('#datatable-responsive').attr('data-url')
			pages: 5)