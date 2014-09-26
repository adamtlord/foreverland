from django.db import models
from members.models import Member
from shows.models import Show


class Song(models.Model):
    # Song info
    name = models.CharField(max_length=200, blank=True, null=True)
    original_artist = models.CharField(max_length=200, blank=True, null=True)
    original_album = models.CharField(max_length=200, blank=True, null=True)
    release_year = models.CharField(max_length=200, blank=True, null=True)
    display = models.BooleanField(default=True)
    # Foreverland info
    singer = models.ManyToManyField(Member, related_name='songs', blank=True, null=True)
    # Setlist info
    foh_notes = models.TextField(verbose_name="Notes for FOH", blank=True, null=True)
    setlist_notes = models.TextField(verbose_name="Notes for Setlist", blank=True, null=True)
    key = models.CharField(max_length=64, blank=True, null=True)
    tempo = models.CharField(max_length=64, blank=True, null=True)

    def __unicode__(self):
        return self.name


class Setlist(models.Model):
    show = models.ForeignKey(Show, related_name='setlist')
    songs = models.ManyToManyField(Song, through='SetlistSong', related_name='songs')
    number_of_sets = models.PositiveSmallIntegerField(blank=True, null=True)
    length_of_set = models.PositiveSmallIntegerField(blank=True, null=True)

    def __unicode__(self):
        return '%s %s' % (self.show.date.strftime('%d/%m/%y'), self.show.venue)


class SetlistSong(models.Model):
    song = models.ForeignKey(Song)
    setlist = models.ForeignKey(Setlist)
    order = models.IntegerField(blank=True, null=True)
    transition_to_next = models.BooleanField(default=False)

    def __unicode__(self):
        return '%s' % self.song
