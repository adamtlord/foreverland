from django.forms import ModelForm

from shows.models import Show, Expense
from fidouche.models import Payment


FINANCIAL_FIELDS = (
	'attendance',
	'payer',
	'payee_check_no',
	'gross',
	'gross_method',
	'commission',
	'commission_withheld',
	'commission_check_no',
	'sound_cost',
	'in_ears_cost',
	'in_ears_check_no',
	'print_ship_cost',
	'ads_cost',
	'other_cost',
	'net',
	'payout',
	'to_account'
)
EXPENSE_FIELDS = (
	'date',
	'payee',
	'category',
	'amount',
	'check_no',
	'notes'
)

class GigFinanceForm(ModelForm):
	class Meta:
		model = Show
		fields = FINANCIAL_FIELDS

	def __init__(self, *args, **kwargs):
		super(GigFinanceForm, self).__init__(*args, **kwargs)
		for field in FINANCIAL_FIELDS:
			self.fields[field].widget.attrs['class'] = 'form-control'


class ExpenseForm(ModelForm):
	class Meta:
		model = Expense

	def __init__(self, *args, **kwargs):
		super(ExpenseForm, self).__init__(*args, **kwargs)
		for field in self.fields:
			self.fields[field].widget.attrs['class'] = 'form-control'
		self.fields['date'].widget.attrs['data-format'] = 'YYYY-MM-DD'


class PaymentForm(ModelForm):
	class Meta:
		model = Payment
		# fields = ('member', 'amount', 'paid')
