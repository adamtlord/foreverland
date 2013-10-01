import datetime

from django.shortcuts import render

from members.models import Member
from shows.models import Show
from marketing.models import Testimonial


def homepage(request, template='marketing/homepage.html'):
    """Returns homepage.html for the root url"""
    public_shows = Show.objects.filter(public=True)
    next_show = public_shows.filter(date__gte=datetime.datetime.now()).order_by('date')[0]
    members = Member.objects.filter(active=True).order_by('display_last')
    vocals = members.filter(active=True, section='v')
    horns = members.filter(active=True, section='h')
    rhythm = members.filter(active=True, section='r')
    testimonial = Testimonial.objects.filter(featured=True).order_by('?')[0]
    
    d = {}
    d['next_show'] = next_show
    d['vocals'] = vocals
    d['horns'] = horns
    d['rhythm'] = rhythm
    d['testimonial'] = testimonial
   
    return render(request, template, d)


def quotes(request, template='marketing/quotes.html'):
    """Featured Testimonials"""
    testimonials = Testimonial.objects.filter(featured=True)

    d = {
        'quotes': testimonials
    }

    return render(request, template, d)

def faq(request, template='marketing/faq.html'):
    """FAQ page"""

    return render(request, template)


def songs(request, template='marketing/songs.html'):
    """Song List page"""

    return render(request, template)


def photos(request, template='marketing/photos.html'):
    """Photos page"""

    return render(request, template)


def video(request, template='marketing/video.html'):
    """Video page"""

    return render(request, template)


def booking(request, template='marketing/booking.html'):
    """Booking/Contact page"""

    return render(request, template)