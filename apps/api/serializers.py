from rest_framework import serializers

from songs.models import Song, Setlist, SetlistSong
from members.models import Member



class SongSerializer(serializers.ModelSerializer): #member
    singer = serializers.RelatedField(many=True)
    class Meta:
        model = Song
        fields = ('name','original_album','release_year','display','singer','foh_notes','setlist_notes','key','tempo')


class SetlistSerializer(serializers.ModelSerializer): #group
    songs = serializers.RelatedField(many=True)
    class Meta:
        model = Setlist
        fields = ('number_of_sets','length_of_set','songs')


class SetlistSongSerializer(serializers.ModelSerializer): #membership
    class Meta:
        model = SetlistSong


class MemberSerializer(serializers.ModelSerializer):
    songs = serializers.RelatedField(many=True)
    
    class Meta:
        model = Member
        fields = ('display_first', 'display_last', 'section', 'songs')
