define([
    'jquery',
    'underscore',
],

function ($) {
    var w = $(window);
    function setHeights(){
        var v = $('.video iframe');
        var vh = Math.floor(0.5625 * v.width());
        v.css('min-height', vh + 'px');
    }
    
    $(function() {
        setHeights();
        var resetHeights = _.debounce(setHeights, 300);
        $(w).resize(resetHeights);
    });
});