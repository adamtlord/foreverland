from datetime import date
import datetime
from django.shortcuts import render, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from shows.models import Show
from fidouche.forms import GigFinanceForm

current_year = date.today().year

@login_required
def financial_dashboard(request, template='fidouche/dashboard.html'):
    """"""
    gigs = Show.objects.all().order_by('-date')
    last_show = gigs.filter(date__lte=datetime.datetime.now()).order_by('-date')[0]
    next_show = gigs.filter(date__gte=datetime.datetime.now()).order_by('date')[0]
    d = {
    	'gigs': gigs,
    	'last_show': last_show,
    	'next_show': next_show
    }
    return render(request, template, d)

@login_required
def gigs_by_year(request, year=current_year, template='fidouche/gigs_by_year.html'):
	"""Choose a gig from this year"""
	gigs = Show.objects.filter(date__year = year)

	d = {
		'year': year,
		'this_years_gigs': gigs
	}
	return render(request, template, d)

@login_required
def gig_finances(request, gig_id=None, template='fidouche/gig_finances.html'):
	"""Choose a gig from this year"""
	gig_id = int(gig_id)
	gig = get_object_or_404(Show, pk=gig_id)
	if request.method == 'GET':
		form = GigFinanceForm(instance=gig)
	else:
		form = GigFinanceForm(request.POST, instance=gig)
		if form.is_valid():
			form.save()
			messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>NICE.</strong> Gig finances updated!')
	d = {
		'form': form,
		'gig': gig
	}

	return render(request, template, d)

