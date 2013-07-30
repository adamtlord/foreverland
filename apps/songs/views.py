from django.shortcuts import render
from songs.models import Song


def list_songs(request, template='songs/song_list.html'):
    """just show all the members"""
    songs = Song.objects.filter(active=True)
    d = {}
    d['songs'] = songs
    return render(request, template, d)
