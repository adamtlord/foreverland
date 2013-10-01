define([
    'jquery',
    'bootstrap',
],

function ($) {
    $('[rel="tooltip"]').tooltip({
        placement: 'right',
        trigger: 'hover'
    });
	$('.detail-launch').click(function(e){
		$.ajax({
			type: "GET",
            url: $(this).data("showurl"),
            success: function(res) {
				$('#show_detail_modal').html(res).modal();
            }
        });
	});
});