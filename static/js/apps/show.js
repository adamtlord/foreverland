define([
    'jquery',
    'bootstrap',
],

function ($) {
    $('[rel="tooltip"]').tooltip({
        placement: 'right',
        trigger: 'hover'
    });
    function initialize() {
        var mapOptions = {
            zoom: 8,
            center: new google.maps.LatLng(-34.397, 150.644),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    }

    function loadScript() {
        var script = document.createElement("script");
        script.type = "text/javascript";
        script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyBPix6hEAwxnKAEdTyKbBFIBz7iT2bFEHo&sensor=TRUE_OR_FALSE&callback=initialize";
        document.body.appendChild(script);
    }
});