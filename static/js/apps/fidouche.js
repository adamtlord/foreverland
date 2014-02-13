define([
    'jquery',
    'underscore',
    'bootstrap',
    'select2',
],

function ($) {
	function updateFields(){
		var commissionField = $('#commission_percentage').find('option:selected').val() == 'other' ? $('#commission_percentage_other') : $('#commission_percentage').find('option:selected');
		var gross = $('#id_gross');
		var commission = $('#id_commission');
		var sound = $('#id_sound_cost');
		var inears = $('#id_in_ears_cost');
		var print = $('#id_print_ship_cost');
		var ads = $('#id_ads_cost');
		var other = $('#id_other_cost');
		var net = $('#id_net');
		var max = $('#max_payout');
		var payout = $('#id_payout');
		var account = $('#id_to_account');
		// payable
		var g = parseFloat(gross.val()) || 0;
		var cp = parseFloat(commissionField.val()) || 0;
		var sc = parseFloat(sound.val()) || 0;
		var iem = parseFloat(inears.val()) || 0;
		var ps = parseFloat(print.val()) || 0;
		var a = parseFloat(ads.val()) || 0;
		var o = parseFloat(other.val()) || 0;
		var p = parseFloat(payout.val()) || 0;
		// receiveable
		var c = '';
		var n = '';
		var acc = '';
		var mp = '';
		if(g>0){
			c = (parseFloat(g * (cp/100)) || 0).toFixed(2);
			n = (parseFloat(g - c - (sc + iem + ps + a + o)) || 0).toFixed(2);
			mp = (parseFloat(n / 14) || 0).toFixed(2);
			acc = (parseFloat(n - (p * 14)) ||0).toFixed(2);
		}
		commission.val(c).change();
		max.html(mp);
		net.val(n).change();
		account.val(acc).change();
	}
	var _updateFields = _.throttle(updateFields, 500);
	$('#gig_select_nav').select2().on("select2-selecting", function(e) {
		window.location = $(this).find("option:selected").val();
	});
	$('.factor').on('blur', 'input', function(){
		_updateFields();
	});
	$('.set-commission').on('change', '#commission_percentage', function(){
		if($(this).find('option:selected').val() == 'other'){
			$('#commission_other').fadeIn('fast');
		}else {
			$('#commission_other').fadeOut('fast');
			_updateFields();
		}
	});
	$('.warn').on('change', 'input', function(){
		var parentGroup = $(this).parents('.form-group');
		parentGroup.removeClass('has-error');
		if($(this).val() && parseFloat($(this).val()) < 0){
			parentGroup.addClass('has-error');
		}
	});
	$('*[rel="tooltip"]').tooltip();
	_updateFields();
});