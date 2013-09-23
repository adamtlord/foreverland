define([
    'jquery',

    'bootstrap',
],

function ($) {
    $(function() {
        // Hompage specific js goes here, if not already in a module
        $('#hero').carousel({
            pause: false
        })
        console.log('hello world');
        var w = $(window);
		var tb = $('#topbrand');
		var tbh = tb.height();
		w.scroll(function(){
			$(this).scrollTop() > (pso - psh + w.height()) ? ps.addClass('in') : ps.removeClass('in');
			$(this).scrollTop() > (tbh) ? tb.addClass('af') : tb.removeClass('af');
		});
    });
});