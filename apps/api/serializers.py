from rest_framework import serializers
from members.models import Member
from shows.models import Show, Venue, Tour
from songs.models import Song, Setlist, SetlistSong


class MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = ('display_first',)


class ShowSerializer(serializers.ModelSerializer):

    class Meta:
        model = Show


class VenueSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Venue


class SongSerializer(serializers.ModelSerializer):
    singer = MemberSerializer(many=True)

    class Meta:
        model = Song


class SetlistSongSerializer(serializers.HyperlinkedModelSerializer):
    song = SongSerializer()

    class Meta:
        model = SetlistSong
        fields = ('song', 'order')


class SetlistSerializer(serializers.HyperlinkedModelSerializer):
    show = serializers.StringRelatedField()
    songs = SetlistSongSerializer(many=True)

    class Meta:
        model = Setlist
        fields = ('show', 'songs',)
