from rest_framework import viewsets
from rest_framework.decorators import detail_route
from members.models import Member
from shows.models import Show, Venue, Tour
from songs.models import Song, Setlist, SetlistSong
from api.serializers import ShowSerializer, VenueSerializer, SongSerializer, \
    SetlistSerializer, SetlistSongSerializer, MemberSerializer


class MemberViewSet(viewsets.ModelViewSet):
    queryset = Member.objects.all()
    serializer_class = MemberSerializer


class ShowViewSet(viewsets.ModelViewSet):
    queryset = Show.objects.all()
    serializer_class = ShowSerializer


class VenueViewSet(viewsets.ModelViewSet):
    queryset = Venue.objects.all()
    serializer_class = VenueSerializer


class SongViewSet(viewsets.ModelViewSet):
    queryset = Song.objects.all()
    serializer_class = SongSerializer


class SetlistSongViewSet(viewsets.ModelViewSet):
    queryset = SetlistSong.objects.all()
    serializer_class = SetlistSongSerializer


class SetlistViewSet(viewsets.ModelViewSet):
    queryset = Setlist.objects.all().order_by('-show__date')
    serializer_class = SetlistSerializer
    lookup_field = 'show_id'
