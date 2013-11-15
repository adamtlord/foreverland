define([
    'jquery',
    'bootstrap',
],

function ($) {
	function initMap(ltlng) {
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
		});
		return map;
	}
	$('.detail-launch').click(function(e){
		$.ajax({
			type: "GET",
            url: $(this).data("showurl"),
            success: function(res) {
				$('#show_detail_modal').html(res).modal();
            }
        });
	});
	$('#show_detail_modal').on('shown.bs.modal', function(){
		var ltlng = $(this).find('#venue_address').val();
		var modalMap = initMap(ltlng);
		google.maps.event.trigger(modalMap, "resize");
	});
});