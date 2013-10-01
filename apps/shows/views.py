import datetime
from django.shortcuts import render, get_object_or_404
from shows.models import Show


def upcoming_shows(request, template='shows/upcoming.html'):
    """list all upcoming shows"""
    public_shows = Show.objects.filter(public=True)
    upcoming_shows = public_shows.filter(date__gte=datetime.datetime.now()).order_by('date')
    d = {}
    d['shows'] = upcoming_shows
    return render(request, template, d)

def show(request, show_id, template='shows/detail.html'):
	"""display individual show"""
	show = get_object_or_404(Show, pk=show_id)
	return render(request, template, {'show':show})

def show_modal(request, show_id, template='shows/modal.html'):
	"""display individual show"""
	show = get_object_or_404(Show, pk=show_id)
	return render(request, template, {'show':show})
