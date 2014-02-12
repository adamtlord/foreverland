from django import forms
from django.forms import ModelForm

from shows.models import Show


FINANCIAL_FIELDS = (
	'gross',
	'commission',
	'sound_cost',
	'in_ears_cost',
	'print_ship_cost',
	'ads_cost',
	'other_cost',
	'net',
	'payout',
	'to_account'
)


class GigFinanceForm(ModelForm):
	class Meta:
		model = Show
		fields = FINANCIAL_FIELDS

	def __init__(self, *args, **kwargs):
		super(GigFinanceForm, self).__init__(*args, **kwargs)
		for field in FINANCIAL_FIELDS:
			self.fields[field].widget.attrs['class'] = 'form-control'