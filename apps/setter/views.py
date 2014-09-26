from django.shortcuts import render, get_object_or_404, redirect
from django.forms.models import inlineformset_factory

from django.contrib.auth.decorators import login_required
from django.contrib import messages

from rest_framework import viewsets

from shows.models import Show
from songs.models import Song, Setlist, SetlistSong

from forms import SetlistForm, SetlistSongForm


@login_required
def setter_dashboard(request, template='setter/dashboard.html'):
    """"""
    
    songs = Song.objects.filter(display=True).order_by('name')
    setlists = Setlist.objects.all()

    d = {
        'songs': songs,
        'setlists': setlists,
    }
    return render(request, template, d)

@login_required
def view_setlist(request, gig_id=None, template='setter/view_setlist.html'):
    """View the setlist from a given show"""

    gig_id = int(gig_id)
    gig = get_object_or_404(Show, pk=gig_id)
    setlist = gig.setlist.all()[:1].get()
    setsongs = SetlistSong.objects.filter(setlist=setlist).order_by('order')

    d = {
        'gig': gig,
        'setsongs': setsongs
    }
    return render(request, template, d)

@login_required
def edit_setlist(request, gig_id=None, template='setter/edit_setlist.html'):
    """Edit the setlist from a given show"""

    gig_id = int(gig_id)
    gig = get_object_or_404(Show, pk=gig_id)
    setlist = gig.setlist.all()[:1].get()
    setsongs = SetlistSong.objects.filter(setlist=setlist).order_by('order')
    SongFormset = inlineformset_factory(Setlist, SetlistSong, form=SetlistSongForm)

    if request.method == "POST":
        form = SetlistForm(request.POST, instance=setlist)
        song_formset = SongFormset(request.POST, instance=setlist)
        if form.is_valid() and song_formset.is_valid():
            form.save()
            song_formset.save()
            messages.add_message(request, messages.SUCCESS, '<i class="fa fa-beer"></i> <strong>NICE.</strong> Setlist saved!')
            return redirect(request.path)
        else:
            messages.add_message(request, messages.ERROR, '<i class="fa fa-wrench"></i> <strong>Aw, damnit.</strong> Something\'s fucked up.')
    else:
        form = SetlistForm(instance=setlist)
        song_formset = SongFormset(instance=setlist)

    d = {
        'gig': gig,
        'setsongs': setsongs,
        'form': form,
        'song_formset': song_formset,
    }

    return render(request, template, d)

def setter_test(request, template='setter/test.html'):
    d = {}
    return render(request, template, d)

