define([
    'jquery',
    'underscore',
    'bootstrap',
],

function ($) {
    var w = $(window);
    var nvo = 0;
    function setHeights(){
        var v = $('#video_wrap iframe');
        var vh = Math.floor(0.5625 * w.width());
        var ch = $('#bio .carousel').height();
        var bt = $('#bio section');
        var bth = bt.height();
        v.css('min-height', vh + 'px');
        bt.css({
            'height': ch + 'px',
            'padding-top': (ch - bth) / 2 + 'px'
        });
        nvo = $('#home_nav').offset().top;
    }
    function setFixed(){
        $('#next_show').toggleClass('up', $(this).scrollTop() > (nvo - 40));
        $('#home_nav, #nav_push').toggleClass('up', $(this).scrollTop() > nvo);
    }
    $(function() {
        // Hompage specific js goes here, if not already in a module
        $('.carousel').carousel({
            pause: false
        });
        setHeights();
        var resetHeights = _.debounce(setHeights, 300);
        var resetFixed = _.throttle(setFixed, 100);
        $(w).resize(resetHeights);
        $(w).scroll(resetFixed);
    });
});