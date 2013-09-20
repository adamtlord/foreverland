from django.shortcuts import render

from members.models import Member


def homepage(request, template='marketing/homepage.html'):
    """Returns homepage.html for the root url"""
    members = Member.objects.filter(active=True).order_by('last_name')
    d = {}
    d['members'] = members
    return render(request, template, d)
