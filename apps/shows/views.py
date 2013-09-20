from django.shortcuts import render, get_object_or_404
from shows.models import Show


def upcoming_shows(request, template='shows/upcoming.html'):
    """list all upcoming shows"""
    shows = Show.objects.all()
    d = {}
    d['shows'] = shows
    return render(request, template, d)

def show(request, show_id, template='shows/detail.html'):
	"""display individual show"""
	show = get_object_or_404(Show, pk=show_id)
	return render(request, template, {'show':show})

