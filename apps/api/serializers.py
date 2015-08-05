from collections import OrderedDict
from rest_framework import serializers
from members.models import Member
from shows.models import Show, Venue, Tour
from songs.models import Song, Setlist, SetlistSong


class MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model = Member
        fields = ('display_first',)


class ShowSerializer(serializers.ModelSerializer):
    venue = serializers.StringRelatedField()

    class Meta:
        model = Show
        fields = ('venue', 'date', 'id')


class VenueSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Venue


class SongSerializer(serializers.ModelSerializer):
    singer = MemberSerializer(many=True)

    class Meta:
        model = Song


class SetlistSongSerializer(serializers.HyperlinkedModelSerializer):
    song_id = serializers.IntegerField(read_only=False)
    song = SongSerializer()

    class Meta:
        model = SetlistSong
        fields = ('song', 'song_id', 'order', 'transition')


class SetlistSerializer(serializers.HyperlinkedModelSerializer):
    show = serializers.StringRelatedField()
    show_id = serializers.IntegerField(read_only=True)
    songs = SetlistSongSerializer(many=True)

    class Meta:
        model = Setlist
        fields = ('show', 'show_id', 'songs',)

    def validate_songs(self, data):
        order_list = []
        for item in data:
            if item['order'] in order_list:
                item['order'] += 1
            order_list.append(item['order'])
        songs = sorted(data, key=lambda x: x['order'])
        for idx, song in enumerate(songs):
            song['order'] = idx
        return data

    def update(self, instance, validated_data):
        instance.setlistsong_set.all().delete()
        for song in validated_data['songs']:
            song_reference = Song.objects.get(pk=song['song_id'])
            song_order = song['order']
            new_song = SetlistSong(
                setlist=instance,
                song=song_reference,
                order=song_order,
                transition=song.transition
            )
            new_song.save()
        instance.save()
        return instance
