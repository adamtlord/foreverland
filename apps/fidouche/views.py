from datetime import date
import datetime
from django.forms.models import inlineformset_factory, modelformset_factory
from django.forms.formsets import formset_factory
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required

from members.models import Member
from shows.models import Show, Expense
from fidouche.models import Payment
from fidouche.forms import GigFinanceForm, ExpenseForm, PaymentForm

current_year = date.today().year

@login_required
def financial_dashboard(request, template='fidouche/dashboard.html'):
	""""""
	gigs = Show.objects.all().order_by('-date')
	last_show = gigs.filter(date__lte=datetime.datetime.now()).order_by('-date')[0]
	next_show = gigs.filter(date__gte=datetime.datetime.now()).order_by('date')[0]
	gigs_booked = gigs.filter(date__year=current_year)
	gigs_played = gigs_booked.filter(date__lt=datetime.datetime.now())
	ytd_gross = []
	ytd_net = []
	ytd_player = []
	for gig in gigs_played:
		if gig.gross:
			ytd_gross.append(gig.gross)
		if gig.net:
			ytd_net.append(gig.net)
		if gig.payout:
			ytd_player.append(gig.payout)

	ytd = {
		'gigs_booked': gigs_booked.count(),
		'gigs_played': gigs_played.count(),
		'net':  sum(ytd_net),
		'gross': sum(ytd_gross),
		'payout': sum(ytd_player)
	}
	d = {
		'gigs': gigs,
		'last_show': last_show,
		'next_show': next_show,
		'ytd': ytd
	}
	return render(request, template, d)

@login_required
def gigs_by_year(request, year=current_year, template='fidouche/gigs_by_year.html'):
	"""Listing of all gigs in the given year"""

	gigs = Show.objects.filter(date__year = year)
	for gig in gigs:
		gig.total_expenses = sum(filter(None,[gig.sound_cost, gig.in_ears_cost, gig.print_ship_cost, gig.ads_cost, gig.other_cost]))
		gig.commission_percentage = ''
		sc = gig.sound_cost or 0
		if gig.commission and gig.gross:
			gig.commission_percentage = int((gig.commission/(gig.gross - sc)) * 100)
	by_month = {
		1:[],
		2:[],
		3:[],
		4:[],
		5:[],
		6:[],
		7:[],
		8:[],
		9:[],
		10:[],
		11:[],
		12:[]
	}
	d = {
		'year': year,
		'this_years_gigs': gigs,
	}
	return render(request, template, d)

@login_required
def gigs_year_over_year(request,template='fidouche/gigs_year_over_year.html'):
	d = {}
	from common.utils import years_with_gigs
	years_with_gigs = years_with_gigs()
	gigs = Show.objects.all()
	years = {}
	for year in years_with_gigs:
		years[year] = {}
		this_years_gigs = gigs.filter(date__year=year)
		y_gross = []
		y_net = []
		y_player = []
		for gig in this_years_gigs:
			if gig.gross:
				y_gross.append(gig.gross)
			if gig.net:
				y_net.append(gig.net)
			if gig.payout:
				y_player.append(gig.payout)
		years[year] = {
			'gigs_played': this_years_gigs.count(),
			'net':  sum(y_net),
			'gross': sum(y_gross),
			'payout': sum(y_player)
		}
	d['years'] = years
	return render(request, template, d)

@login_required
@staff_member_required
def gig_finances(request, gig_id=None, template='fidouche/gig_finances.html'):
	"""Choose a gig from this year"""

	gig_id = int(gig_id)
	gig = get_object_or_404(Show, pk=gig_id)
	active_members = Member.objects.filter(active=True)

	initial_payments = []

	ExpenseFormSet = inlineformset_factory(Show, Expense)
	PaymentFormSet = inlineformset_factory(Show, Payment, form=PaymentForm, extra=len(active_members), max_num=14, can_delete=False)	

	if request.method == "POST":
		form = GigFinanceForm(request.POST, instance=gig)
		expense_formset = ExpenseFormSet(request.POST, instance=gig)
		payment_formset = PaymentFormSet(request.POST, instance=gig)
		if form.is_valid() and expense_formset.is_valid() and payment_formset.is_valid():
			form.save()
			expense_formset.save()
			payment_formset.save()
			messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>NICE.</strong> Gig finances updated!')
			return redirect(request.path)
	else:
		form = GigFinanceForm(instance=gig)
		expense_formset = ExpenseFormSet(instance=gig)
		payment_formset = PaymentFormSet(instance=gig)

	d = {
		'form': form,
		'expense_formset': expense_formset,
		'payment_formset': payment_formset,
		'gig': gig
	}

	return render(request, template, d)


@login_required
def expenses_list(request, template='fidouche/expenses_list.html'):
	"""Show non-gig expenses"""
	expenses = Expense.objects.filter(show__isnull=True)
	d = {
		'expenses': expenses
	}

	return render(request, template, d)


@login_required
@staff_member_required
def expense_details(request, expense_id=None, template='fidouche/expense_details.html'):
	"""Show/edit single expense"""
	expense_id = int(expense_id)
	expense = get_object_or_404(Expense, pk=expense_id)

	if request.method == "POST":
		form = ExpenseForm(request.POST, instance=expense)
		if form.is_valid():
			form.save()
			messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>KA-CHING.</strong> Expense edited.')
			return redirect(request.path)
	else:
		form = ExpenseForm(instance=expense)

	d = {
		'form': form,
		'expense': expense
	}

	return render(request, template, d)

@login_required
@staff_member_required
def expense_create(request, template='fidouche/expense_create.html'):
	"""Create a new expense record"""

	if request.method == "POST":
		form = ExpenseForm(request.POST)
		form.save()
		messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>KA-CHING.</strong> Expense added.')
		return redirect(expenses_list)

	else:
		form = ExpenseForm()
		expense = None

	d = {
		'form': form,
		'expense': expense
	}

	return render(request, template, d)


@login_required
@staff_member_required
def expense_delete(request, expense_id=None):
	"""Delete an expense record"""
	expense_id = int(expense_id)
	expense = get_object_or_404(Expense, pk=expense_id)
	if expense_id:
		expense.delete()
		messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>Toast.</strong> Expense deleted.')
	else:
		messages.add_message(request, messages.WARNING, '<i class="fa fa-warning"></i> <strong>HUH?</strong> That\'s not a thing.')

	return redirect(expenses_list)



