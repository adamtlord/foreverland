from datetime import date
import random
import datetime
from django.forms.models import inlineformset_factory
from django.db.models import Sum, Q
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.admin.views.decorators import staff_member_required

from members.models import Member
from shows.models import Show
from fidouche.models import Payment, SubPayment, Expense, Quote
from fidouche.forms import GigFinanceForm, ExpenseForm, PaymentForm, SubPaymentForm

current_year = date.today().year

@login_required
def financial_dashboard(request, template='fidouche/dashboard.html'):
	""""""
	gigs = Show.objects.filter(date__year = current_year)
	last_show = Show.objects.filter(date__lte=datetime.datetime.now()).order_by('-date')[0]
	next_show = gigs.filter(date__gte=datetime.datetime.now()).order_by('date')[0]
	gigs_booked = gigs.filter(date__year=current_year)
	gigs_played = gigs_booked.filter(date__lt=datetime.datetime.now())
	count = Quote.objects.all().count()
	slice = random.random() * (count - 1)
	quotes = Quote.objects.all()[slice: slice+1]
	ytd_gross = []
	ytd_net = []
	ytd_player = []
	for gig in gigs:
		gig.total_expenses = sum(filter(None,[gig.sound_cost, gig.in_ears_cost, gig.print_ship_cost, gig.ads_cost, gig.other_cost]))
		gig_expenses = Expense.objects.filter(show = gig)
		sc = gig.sound_cost or 0
		if gig_expenses:
			for expense in gig_expenses:
				try:
					expense.amount = int(expense.amount)
				except TypeError:
					expense.amount = 0
				try:
					gig.other_cost = int(gig.other_cost)
				except TypeError:
					gig.other_cost = 0
				sum([gig.other_cost,expense.amount])

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
		'ytd': ytd,
		'quote': quotes[0]
	}
	return render(request, template, d)

@login_required
def gigs_by_year(request, year=current_year, template='fidouche/gigs_by_year.html'):
	"""Listing of all gigs in the given year"""

	gigs = Show.objects.filter(date__year = year)
	current = False
	if int(year) == int(current_year):
		gigs = gigs.filter(date__lt=datetime.datetime.now())
		current = True
	by_month = {}
	players = []
	commission = []
	sound = []
	iem = []
	printship = []
	ads = []
	other = []
	all_expenses = []
	to_account = []
	gross = []
	net = []
	payout = []

	for m in range(1,13):
		month_gigs = gigs.filter(date__month = m)
		by_month[m] = {
			'count': month_gigs.count(),
			'gross': month_gigs.aggregate(Sum('gross'))
		}

	for gig in gigs:
		gig_itemized_expenses = Expense.objects.filter(show=gig)
		gig.total_expenses = sum(filter(None,[gig.sound_cost, gig.in_ears_cost, gig.print_ship_cost, gig.ads_cost, gig.other_cost]))
		all_expenses.append(gig.total_expenses)
		if gig_itemized_expenses:
			for expense in gig_itemized_expenses:
				try:
					expense.amount = int(expense.amount)
				except TypeError:
					expense.amount = 0
				other.append(expense.amount)
				all_expenses.append(expense.amount)

		gig.payments = Payment.objects.filter(show=gig)
		if gig.payments:
			for pay in gig.payments:
				if pay.amount:
					players.append(pay.amount)
		else:
			if gig.payout:
				players.append(gig.payout * 14)

		if gig.commission:
			commission.append(gig.commission)
		if gig.sound_cost:
			sound.append(gig.sound_cost)
		if gig.in_ears_cost:
			iem.append(gig.in_ears_cost)
		if gig.print_ship_cost:
			printship.append(gig.print_ship_cost)
		if gig.ads_cost:
			ads.append(gig.ads_cost)
		if gig.other_cost:
			other.append(gig.other_cost)
		if gig.to_account:
			to_account.append(gig.to_account)
		if gig.gross:
			gross.append(gig.gross)
		if gig.net:
			net.append(gig.net)
		if gig.payout:
			payout.append(gig.payout)

	d = {
		'year': year,
		'this_years_gigs': gigs,
		'gigs_played': gigs.count(),
		'gross': sum(gross),
		'net': sum(net),
		'payout': sum(payout),
		'current': current,
		'by_month': by_month,
		'players': sum(players),
		'commission': sum(commission),
		'sound': sum(sound),
		'iem': sum(iem),
		'printship': sum(printship),
		'ads': sum(ads),
		'other': sum(other),
		'all_expenses': sum(all_expenses),
		'to_account': sum(to_account)
	}
	return render(request, template, d)

@login_required
def gigs_year_over_year(request,template='fidouche/gigs_year_over_year.html'):
	d = {}
	from common.utils import years_with_gigs
	years_with_gigs = years_with_gigs()
	gigs = Show.objects.all()
	years = {}
	players = []
	commission = []
	sound = []
	iem = []
	printship = []
	ads = []
	other = []
	all_expenses = []
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

	for gig in gigs:
		gig.payments = Payment.objects.filter(show=gig)
		gig.total_expenses = sum(filter(None,[gig.sound_cost, gig.in_ears_cost, gig.print_ship_cost, gig.ads_cost, gig.other_cost]))
		gig_expenses = Expense.objects.filter(show = gig)
		all_expenses.append(gig.total_expenses)
		if gig.payments:
			for pay in gig.payments:
				if pay.amount:
					players.append(pay.amount)
		else:
			if gig.payout:
				players.append(gig.payout * 14)
		if gig.commission:
			commission.append(gig.commission)
		if gig.sound_cost:
			sound.append(gig.sound_cost)
		if gig.in_ears_cost:
			iem.append(gig.in_ears_cost)
		if gig.print_ship_cost:
			printship.append(gig.print_ship_cost)
		if gig.ads_cost:
			ads.append(gig.ads_cost)
		if gig.other_cost:
			other.append(gig.other_cost)
		if gig_expenses:
			for expense in gig_expenses:
				other.append(expense.amount)

	d['all_gigs'] = gigs

	return render(request, template, d)

@login_required
@staff_member_required
def gig_finances(request, gig_id=None, template='fidouche/gig_finances.html'):
	"""Choose a gig from this year"""

	gig_id = int(gig_id)
	gig = get_object_or_404(Show, pk=gig_id)
	active_members = Member.objects.filter(active=True)

	ExpenseFormSet = inlineformset_factory(Show, Expense, form=ExpenseForm)
	PaymentFormSet = inlineformset_factory(Show, Payment, form=PaymentForm, extra=len(active_members), max_num=14, can_delete=False)
	SubPaymentFormSet = inlineformset_factory(Show, SubPayment, form=SubPaymentForm)

	if request.method == "POST":
		form = GigFinanceForm(request.POST, request.FILES, instance=gig)
		expense_formset = ExpenseFormSet(request.POST, request.FILES, instance=gig)
		payment_formset = PaymentFormSet(request.POST, instance=gig)
		sub_payment_formset = SubPaymentFormSet(request.POST, instance=gig)
		if form.is_valid() and expense_formset.is_valid() and payment_formset.is_valid() and sub_payment_formset.is_valid():
			form.save()
			expense_formset.save()
			payment_formset.save()
			sub_payment_formset.save()
			messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>NICE.</strong> Gig finances updated!')
			return redirect(request.path)
		else:
			messages.add_message(request, messages.ERROR, '<i class="fa fa-wrench"></i> <strong>Aw, damnit.</strong> Something\'s fucked up.')
	else:
		form = GigFinanceForm(instance=gig)
		expense_formset = ExpenseFormSet(instance=gig)
		payment_formset = PaymentFormSet(instance=gig)
		sub_payment_formset = SubPaymentFormSet(instance=gig)

	d = {
		'form': form,
		'expense_formset': expense_formset,
		'payment_formset': payment_formset,
		'sub_payment_formset': sub_payment_formset,
		'gig': gig
	}

	return render(request, template, d)


@login_required
def gig_finances_view(request, gig_id=None, template='fidouche/gig_finances_view.html'):
	"""Read-only view of gig finance info"""

	gig_id = int(gig_id)
	gig = get_object_or_404(Show, pk=gig_id)
	payments = Payment.objects.filter(show=gig)
	sub_payments = SubPayment.objects.filter(show=gig)
	expenses = Expense.objects.filter(show=gig)
	buyouts = False
	if gig.fee or gig.food_buyout or gig.travel_buyout or gig.lodging_buyout or gig.other_buyout:
		buyouts = True

	d = {
		'gig': gig,
		'payments': payments,
		'sub_payments': sub_payments,
		'expenses': expenses,
		'buyouts': buyouts
	}

	return render(request, template, d)


@login_required
def expenses_list(request, year=current_year, template='fidouche/expenses_list.html'):
	"""Show non-gig expenses"""
	expenses = Expense.objects.filter(show__isnull=True, date__year=year)
	d = {
		'expenses': expenses
	}

	return render(request, template, d)


@login_required
def all_expenses_list(request, template='fidouche/expenses_list.html'):
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
		form = ExpenseForm(request.POST, request.FILES, instance=expense)
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
		form = ExpenseForm(request.POST, request.FILES)
		form.save()
		messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>KA-CHING.</strong> Expense added.')
		return redirect(all_expenses_list)

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


@login_required
def finance_reports(request, template='fidouche/finance_reports.html'):
	"""View finance reports for a given timeframe"""

	d = {
		'no_dates': False
	}
	start = request.GET.get('start_date', None)
	end = request.GET.get('end_date', None)
	if start and end:
		start_date = datetime.datetime.strptime(start, "%Y-%m-%d")
		end_date = datetime.datetime.strptime(end, "%Y-%m-%d")

		member_payments = {}
		memberPayments = Payment.objects.filter(show__date__range=(start_date, end_date)).filter(paid=True).filter(amount__gt=0)
		for payment in memberPayments:
			if payment.member in member_payments:
				member_payments[payment.member]['total'].append(payment.amount)
				member_payments[payment.member]['payments'].append(payment)
			else:
				member_payments[payment.member] = {
					'total': [payment.amount],
					'payments': [payment]
				}
		for member in member_payments:
			member_payments[member]['total'] = sum(member_payments[member]['total'])
		d.update({'member_payments':member_payments})

		sub_payments = {}
		subPayments = SubPayment.objects.filter(show__date__range=(start_date, end_date)).filter(paid=True).filter(amount__gt=0)
		for payment in subPayments:
			if payment.sub in sub_payments:
				sub_payments[payment.sub]['total'].append(payment.amount)
				sub_payments[payment.sub]['payments'].append(payment)
			else:
				sub_payments[payment.sub] = {
					'total': [payment.amount],
					'payments': [payment]
				}
		for sub in sub_payments:
			sub_payments[sub]['total'] = sum(sub_payments[sub]['total'])
		d.update({
			'sub_payments':sub_payments,
		})

		expense_payments = {}
		expensePayments = Expense.objects.filter(date__range=(start_date, end_date)).filter(amount__gt=0)
		for payment in expensePayments:
			if payment.payee in expense_payments:
				expense_payments[payment.payee]['total'].append(payment.amount)
				expense_payments[payment.payee]['payments'].append(payment)
			else:
				expense_payments[payment.payee] = {
					'total':[payment.amount],
					'payments':[payment]
				}
		for payee in expense_payments:
			expense_payments[payee]['total'] = sum(expense_payments[payee]['total'])
		d.update({'expense_payments':expense_payments})

	else:
		d['no_dates'] = True

	return render(request, template, d)

@login_required
def tax_reports(request, template='fidouche/tax_reports.html'):
	"""View finance reports for a given timeframe"""

	d = {
		'no_dates': False
	}
	start = request.GET.get('start_date', None)
	end = request.GET.get('end_date', None)
	if start and end:
		start_date = datetime.datetime.strptime(start, "%Y-%m-%d").date()
		end_date = datetime.datetime.strptime(end, "%Y-%m-%d").date()

		payments = Payment.objects.filter(show__date__range=(start_date, end_date)).filter(paid=True).filter(amount__gt=0)

		# PARTNER PAYMENTS aka "Guaranteed Payments"
		# We want all payments to members who were partners during this time period.
		# That means they became a member before the start date AND
		# they stopped being a member after it (OR they haven't stopped being a member, ie, no date_partner_left)
		partnerPayments = payments.filter(member__date_partner_joined__lte=start_date).filter(Q(member__date_partner_left__isnull=True) | Q(member__date_partner_left__gte=end_date))
		partner_payments = {}
		for payment in partnerPayments:
			if payment.member in partner_payments:
				partner_payments[payment.member]['total'].append(payment.amount)
				partner_payments[payment.member]['payments'].append(payment)
			else:
				partner_payments[payment.member] = {
					'total': [payment.amount],
					'payments': [payment]
				}
		for member in partner_payments:
			partner_payments[member]['total'] = sum(partner_payments[member]['total'])
		d.update({'partner_payments':partner_payments})

		non_partner_payments = {}
		subPayments = SubPayment.objects.filter(show__date__range=(start_date, end_date)).filter(paid=True).filter(amount__gt=0)
		nonPartnerPayments = payments.exclude(id__in=partnerPayments)

		for payment in subPayments:
			if payment.sub in non_partner_payments:
				non_partner_payments[payment.sub]['total'].append(payment.amount)
				non_partner_payments[payment.sub]['payments'].append(payment)
			else:
				non_partner_payments[payment.sub] = {
					'total': [payment.amount],
					'payments': [payment]
				}

		for payment in nonPartnerPayments:
			if payment.member in non_partner_payments:
				non_partner_payments[payment.member]['total'].append(payment.amount)
				non_partner_payments[payment.member]['payments'].append(payment)
			else:
				non_partner_payments[payment.member] = {
					'total': [payment.amount],
					'payments': [payment]
				}

		for person in non_partner_payments:
			non_partner_payments[person]['total'] = sum(non_partner_payments[person]['total'])

		d.update({
			'non_partner_payments':non_partner_payments,
		})

		expense_payments = {}
		expensePayments = Expense.objects.filter(date__range=(start_date, end_date)).filter(amount__gt=0)
		for payment in expensePayments:
			if payment.new_category.tax_category.name in expense_payments:
				expense_payments[payment.new_category.tax_category.name]['total'].append(payment.amount)
				expense_payments[payment.new_category.tax_category.name]['payments'].append(payment)
			else:
				expense_payments[payment.new_category.tax_category.name] = {
					'total':[payment.amount],
					'payments':[payment]
				}
		for category in expense_payments:
			expense_payments[category]['total'] = sum(expense_payments[category]['total'])
			expense_payments[category]['show'] = True

		d.update({'expense_payments':expense_payments})

	else:
		d['no_dates'] = True

	return render(request, template, d)



