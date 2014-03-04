define([
    'jquery',
    'bootstrap',
    'magnific-popup'
],

function ($) {
    $(function(){
		$('.album').magnificPopup({
			delegate: 'a',
			type:'image',
			gallery: {
				enabled: true
			},
			zoom: {
				enabled: true,
				duration: 300,
				easing: 'ease-in-out',
				opener: function(openerElement) {
					return openerElement.is('img') ? openerElement : openerElement.find('img');
				}
			}
		});
    });
});