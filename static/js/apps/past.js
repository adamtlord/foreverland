define([
    'jquery',
    'jquery.scrollTo',
    'jquery.easing'
],

function ($) {
	$('.jump-year').click(function(e){
		e.preventDefault();
		var self = $(this);
		$.scrollTo($(self.attr('href')), 1000, {
            axis: 'y',
            easing: 'easeOutQuart',
            offset: -70
        });
	});
	$('.scroll-top').click(function(e){
		e.preventDefault();
		$.scrollTo(0, 1000, {
            axis: 'y',
            easing: 'easeOutQuart',
        });
	});
});