define([
    'jquery',
    'bootstrap',
],

function ($) {
	function initMap(ltlng) {
		console.log('initMap');
		var thisltlng = new google.maps.LatLng(ltlng.split(",")[0], ltlng.split(",")[1]);
		var mapOptions = {
			zoom: 12,
			center: thisltlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
		var marker = new google.maps.Marker({
			position: thisltlng,
			map: map,
			title: 'Hello World!'
		});
	}

    $('[rel="tooltip"]').tooltip({
        placement: 'right',
        trigger: 'hover'
    });
	$('.detail-launch').click(function(e){
		console.log('get detail modal');
		$.ajax({
			type: "GET",
            url: $(this).data("showurl"),
            success: function(res) {
				console.log(res);
				$('#show_detail_modal').html(res).modal();
            }
        });
	});
	$('#show_detail_modal').on('shown.bs.modal', function(){
		console.log('modal show');
		var ltlng = $('#venue_address').val();
		console.log(ltlng);
		initMap(ltlng);
	});
});