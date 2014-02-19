from datetime import date
import datetime
from django.forms.models import inlineformset_factory
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from shows.models import Show, Expense
from fidouche.forms import GigFinanceForm

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
	"""Choose a gig from this year"""
	gigs = Show.objects.filter(date__year = year)
	d = {
		'year': year,
		'this_years_gigs': gigs,
	}
	return render(request, template, d)

@login_required
def gig_finances(request, gig_id=None, template='fidouche/gig_finances.html'):
	"""Choose a gig from this year"""
	gig_id = int(gig_id)
	gig = get_object_or_404(Show, pk=gig_id)
	ExpenseFormSet = inlineformset_factory(Show, Expense)

	if request.method == "POST":
		form = GigFinanceForm(request.POST, instance=gig)
		formset = ExpenseFormSet(request.POST, instance=gig)
		if form.is_valid() and formset.is_valid():
			form.save()
			formset.save()
			messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>NICE.</strong> Gig finances updated!')
			return redirect(request.path)
	else:
		form = GigFinanceForm(instance=gig)
		formset = ExpenseFormSet(instance=gig)

	d = {
		'form': form,
		'formset': formset,
		'gig': gig
	}

	return render(request, template, d)

