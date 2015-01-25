from django import forms
from fidouche.widgets import AdminImageWidget
from shows.models import Show
from fidouche.models import Payment, SubPayment, Expense, ProductionPayment


FINANCIAL_FIELDS = (
	'attendance',
	'payer',
	'payee_check_no',
	'gross',
	'gross_method',
	'gross_itemized',
	'fee',
	'food_buyout',
	'travel_buyout',
	'lodging_buyout',
	'other_buyout',
	'commission',
	'agent',
	'commission_percentage',
	'commission_withheld',
	'commission_check_no',
	'commission_paid',
	'sound_cost',
	'in_ears_cost',
	'in_ears_check_no',
	'print_ship_cost',
	'ads_cost',
	'other_cost',
	'net',
	'payout',
	'to_account',
	'subs',
	'costs_itemized',
	'settlement_sheet'
)
EXPENSE_FIELDS = (
	'date',
	'payee',
	'new_category',
	'amount',
	'check_no',
	'notes'
)

PRODUCTION_FIELDS = (
	'company',
	'amount',
	'check_no',
	'category',
)

class GigFinanceForm(forms.ModelForm):
	class Meta:
		model = Show
		fields = FINANCIAL_FIELDS
		widgets = {
			'settlement_sheet': AdminImageWidget()
		}

	def __init__(self, *args, **kwargs):
		super(GigFinanceForm, self).__init__(*args, **kwargs)
		for field in FINANCIAL_FIELDS:
			if field not in ['settlement_sheet', 'commission_paid']:
				self.fields[field].widget.attrs['class'] = 'form-control'


class ExpenseForm(forms.ModelForm):
	class Meta:
		model = Expense
		widgets = {
			'receipt_img': AdminImageWidget()
		}

	def __init__(self, *args, **kwargs):
		super(ExpenseForm, self).__init__(*args, **kwargs)
		for field in EXPENSE_FIELDS:
			self.fields[field].widget.attrs['class'] = 'form-control input-sm'
		self.fields['date'].widget.attrs['data-format'] = 'YYYY-MM-DD'


class PaymentForm(forms.ModelForm):
	class Meta:
		model = Payment
	def __init__(self, *args, **kwargs):
		super(PaymentForm, self).__init__(*args, **kwargs)
		self.fields['member'].widget.attrs['class'] = 'form-control input-sm'
		self.fields['amount'].widget.attrs['class'] = 'form-control input-sm'


class SubPaymentForm(forms.ModelForm):
	class Meta:
		model = SubPayment
	def __init__(self, *args, **kwargs):
		super(SubPaymentForm, self).__init__(*args, **kwargs)
		self.fields['sub'].widget.attrs['class'] = 'form-control input-sm'
		self.fields['amount'].widget.attrs['class'] = 'form-control input-sm'


class ProductionPaymentForm(forms.ModelForm):
	class Meta:
		model = ProductionPayment

	def __init__(self, *args, **kwargs):
		super(ProductionPaymentForm, self).__init__(*args, **kwargs)
		for field in PRODUCTION_FIELDS:
			self.fields[field].widget.attrs['class'] = 'form-control'

