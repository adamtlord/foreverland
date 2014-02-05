from datetime import date
from django.shortcuts import render, get_object_or_404

from shows.models import Show

current_year = date.today().year

def financial_dashboard(request, template='fidouche/dashboard.html'):
    """"""
    d = {}
    return render(request, template, d)

def gig_finance_dashboard(request, year=None, template='fidouche/gig_dashboard.html'):
	"""Choose a gig from this year"""
	years_with_gigs = Show.objects.all().dates('date', 'year')
	gigs = Show.objects.filter(date__year = year)

	d = {
		'year': year,
		'this_years_gigs': gigs
	}
	return render(request, template, d)

def gig_finances(request, gig_id=None, template='fidouche/gig_finances.html'):
	"""Choose a gig from this year"""
	gig_id = int(gig_id)
	gig = get_object_or_404(Show, pk=gig_id)
	d = {
		'gig': gig
	}
	return render(request, template, d)

