from django.shortcuts import render
from shows.models import Show


def upcoming_shows(request, template='shows/upcoming.html'):
    """list all upcoming shows"""
    shows = Show.objects.all()
    d = {}
    d['shows'] = shows
    return render(request, template, d)
