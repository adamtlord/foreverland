from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required

from shows.models import Show
from songs.models import Song, Setlist


@login_required
def setter_dashboard(request, template='setter/setter_app.html'):
    """"""

    return render(request, template)


@login_required
def view_setlist(request, gig_id=None, template='setter/view_setlist.html'):
    """View the setlist from a given show"""

    gig_id = int(gig_id)
    gig = get_object_or_404(Show, pk=gig_id)

    d = {
        'gig': gig,
    }

    return render(request, template, d)

