var map, heatmap, venues;
var venuePoints = [];
var markers = [];
var heatData = [];
var dataUrl = $('#venue_map').data('url');
function fetchVenueData() {
    $.ajax({
        type: "GET",
        url: dataUrl,
        dataType: 'json',
        cache: true,
        success: function(data) {
            venues = data;
            initialize();
        },
        error: function(xhr, status, err) {
            console.error(xhr, status, err);
        }
    });
}

function windowContent(i) {
    var v = venues[i];
    var img = v.image ? '<img src="' + v.image + '" width="36" /><br>' : '';
    var show_str = v.shows.length > 1 ? 'shows' : 'show';
    var avg_str = v.shows.length > 1 ? '<br>($' + v.average_display + ' avg.) ' : '';
    return img + '<strong>' + v.name + '</strong><br>' + v.city + ', ' + v.state + '<br><strong>' + v.shows.length + '</strong> ' + show_str + ' — <strong>$' + v.net_display +'</strong>' +  avg_str + '<br><small>' + v.shows.join(', ') + '</small>';
}

function initialize(){
    var mapOptions = {
        zoom: 5,
        center: new google.maps.LatLng(39.833333, -98.583333),
        mapTypeId: google.maps.MapTypeId.TERRAIN
    };
    map = new google.maps.Map(document.getElementById('venue_map'), mapOptions);
    heatmap = new google.maps.visualization.HeatmapLayer({radius: 20, opacity: .9, data: heatData});
    var infowindow = new google.maps.InfoWindow({maxWidth: 300});
    var marker, i;
    for (i = 0; i < venues.length; i++) {
        var venue = venues[i];
        var point = new google.maps.LatLng(venue.coordinates[0], venue.coordinates[1]);
        venuePoints.push(point);
        marker = new google.maps.Marker({
            position: point,
            map: map
        });
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infowindow.setContent(windowContent(i));
                infowindow.open(map, marker);
            }
        })(marker, i));
        markers.push(marker);
    }
    pointArray = new google.maps.MVCArray(venuePoints);
}

function toggleHeatmap(state, param) {
    heatData = []
    var mapstate = state ? map : null;
    var collapsestate = state ? 'show' : 'hide';
    if(state){
        for (i = 0; i < venues.length; i++) {
            var venue = venues[i];
            var point = new google.maps.LatLng(venue.coordinates[0], venue.coordinates[1]);
            weightedLocation = {
                location: point,
                weight: venue[param]
            }
            heatData.push(weightedLocation);
        }
    }
    $('.heatmap-params').collapse(collapsestate);
    heatmap.setData(heatData);
    heatmap.setMap(mapstate);
}

function toggleMarkers(state) {
    if (state) {
        for (var i = 0, n = markers.length; i < n; ++i) {
            markers[i].setMap(map);
        }
    } else {
        for (var i = 0, n = markers.length; i < n; ++i) {
            markers[i].setMap(null);
        }
    }
}


$('#panel #markers').on('change', function(e) {
    toggleMarkers($(this).is(':checked'));
});
$('#panel #heatmap, #panel .param-input').on('change', function(e) {
    toggleHeatmap($(this).is(':checked'), $('input[name="param"]:checked').val());
});
$('.heatmap-params').collapse({
    toggle: false,
});
$(window).load(fetchVenueData());