define([
    'jquery',
    'underscore',
    'bootstrap',
    'select2',
],

function ($) {
	// Methods
	function updateFields(){
		var commissionField = $('#commission_percentage').find('option:selected').val() == 'other' ? $('#commission_percentage_other') : $('#commission_percentage').find('option:selected');
		var gross = $('#id_gross');
		var commission = $('#id_commission');
		var sound = $('#id_sound_cost');
		var inears = $('#id_in_ears_cost').find('option:selected');
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
		var c, n, acc, mp = '';
		if(g>0){
			c = (parseFloat((g - sc) * (cp/100)) || 0).toFixed(2);
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
	
	function processItemized(){
		var printCosts = 0;
		var shipCosts = 0;
		var adCosts = 0;
		var otherCosts = 0;
		$('#expenses_formset tbody tr').each(function(){
			var thisCat = $(this).find('.category option:selected').val();
			var thisAmount = parseFloat($(this).find('.expense-amount input').val()) || 0;
			switch(thisCat){
				case 'print':
				printCosts += thisAmount;
				break;
				case 'ship':
				shipCosts += thisAmount;
				break;
				case 'ads':
				adCosts += thisAmount;
				break;
				case 'other':
				otherCosts += thisAmount;
				break;
				default:
				return;
			}
		});
		if(printCosts + shipCosts !== 0){$('#id_print_ship_cost').val(printCosts + shipCosts).change();}
		if(adCosts !== 0){$('#id_ads_cost').val(adCosts).change();}
		if(otherCosts !== 0){$('#id_other_cost').val(otherCosts).change();}
		_updateFields();
	}
	function cloneMore(selector, type) {
		var newElement = $(selector).clone(true);
		var total = $('#id_' + type + '-TOTAL_FORMS').val();
		newElement.find(':input').each(function() {
			var name = $(this).attr('name').replace('-' + (total-1) + '-','-' + total + '-');
			var id = 'id_' + name;
			$(this).attr({'name': name, 'id': id}).val('').removeAttr('checked');
		});
		newElement.find('label').each(function() {
			var newFor = $(this).attr('for').replace('-' + (total-1) + '-','-' + total + '-');
			$(this).attr('for', newFor);
		});
		total++;
		$('#id_' + type + '-TOTAL_FORMS').val(total);
		$(selector).after(newElement);
	}

	// Handlers //
	$('#gig_select_nav').select2().on('change', function(e) {
		window.location = $(this).find('option:selected').val();
	});

	$('.factor').on('blur', 'input, select', function(){
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
	$('.set-payer').on('change', '#id_payer', function(){
		if($(this).find('option:selected').val() == 'DS'){
			$('#commission_withheld').fadeIn('fast');
		}else {
			$('#commission_withheld').fadeOut('fast');
		}
	});
	$('#commission_withheld').on('change', '#id_commission_withheld', function(){
		if($(this).is(':checked')){
			$('#commission_check').fadeOut('fast');
		}else {
			$('#commission_check').fadeIn('fast');
		}
	});
	$('.payment-method').on('change', '#id_gross_method', function(){
		if($(this).find('option:selected').val() == 'check'){
			$('#payment_check_no').fadeIn('fast');
		}else {
			$('#payment_check_no').fadeOut('fast');
		}
	});
	$('.warn').on('change', 'input', function(){
		var parentGroup = $(this).parents('.form-group');
		parentGroup.removeClass('has-error');
		if($(this).val() && parseFloat($(this).val()) < 0){
			parentGroup.addClass('has-error');
		}
	});
	$('#itemize-toggle').click(function(){
		if($(this).hasClass('active')){
			$('#id_costs_itemized').val('False');
			$('.expenses-summed input').removeAttr('readonly');
		} else {
			$('#id_costs_itemized').val('True');
			$('.expenses-summed input').attr('readonly','readonly');
		}
		$('#itemize').collapse('toggle');

	});
	$('#expenses_formset').on('blur', '.expense-amount input, .category select', function(){
		processItemized();
	});
	$('#add_expense_rows').click(function(){
		cloneMore('#expenses_formset tr:last', 'expense');
	});
	// On load //
	if($('#id_costs_itemized').val() == 'True'){
		$('#itemize-toggle').click();
	}
	_updateFields();
	processItemized();

	$('.datatable').dataTable({
		"iDisplayLength": 100,
		"aoColumnDefs": [
			{"bVisible": false, "aTargets": [0]},
			{"asSorting": ["asc"], "aTargets": [0]},
			{"iDataSort": 0, "aTargets": [1]},
			{"sType": "currency", "aTargets": [4,5,6,7]}
		],
	});
	$('.datatable-years').dataTable({
		"bPaginate": false,
		"bLengthChange": false,
		"bFilter": false,
		"bInfo": false,
	});
});