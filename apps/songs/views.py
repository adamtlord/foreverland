from django.shortcuts import render
from songs.models import Song


def list_songs(request, template='songs/song_list.html'):
    """just show all the songs"""
    songs = Song.objects.all().order_by('name')
    d = {}
    d['songs'] = songs
    return render(request, template, d)
