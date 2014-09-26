# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Song.setlist_notes'
        db.add_column(u'songs_song', 'setlist_notes',
                      self.gf('django.db.models.fields.TextField')(null=True, blank=True),
                      keep_default=False)

        # Adding field 'Song.key'
        db.add_column(u'songs_song', 'key',
                      self.gf('django.db.models.fields.CharField')(max_length=64, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Song.tempo'
        db.add_column(u'songs_song', 'tempo',
                      self.gf('django.db.models.fields.CharField')(max_length=64, null=True, blank=True),
                      keep_default=False)

        # Adding field 'SetlistSong.transition_to_next'
        db.add_column(u'songs_setlistsong', 'transition_to_next',
                      self.gf('django.db.models.fields.BooleanField')(default=False),
                      keep_default=False)

        # Adding field 'Setlist.number_of_sets'
        db.add_column(u'songs_setlist', 'number_of_sets',
                      self.gf('django.db.models.fields.PositiveSmallIntegerField')(null=True, blank=True),
                      keep_default=False)

        # Adding field 'Setlist.length_of_set'
        db.add_column(u'songs_setlist', 'length_of_set',
                      self.gf('django.db.models.fields.PositiveSmallIntegerField')(null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Song.setlist_notes'
        db.delete_column(u'songs_song', 'setlist_notes')

        # Deleting field 'Song.key'
        db.delete_column(u'songs_song', 'key')

        # Deleting field 'Song.tempo'
        db.delete_column(u'songs_song', 'tempo')

        # Deleting field 'SetlistSong.transition_to_next'
        db.delete_column(u'songs_setlistsong', 'transition_to_next')

        # Deleting field 'Setlist.number_of_sets'
        db.delete_column(u'songs_setlist', 'number_of_sets')

        # Deleting field 'Setlist.length_of_set'
        db.delete_column(u'songs_setlist', 'length_of_set')


    models = {
        u'members.member': {
            'Meta': {'object_name': 'Member'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'bio': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'display_first': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'display_last': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'dob': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'instrument': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'join_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'middle_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'section': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        },
        u'shows.show': {
            'Meta': {'ordering': "['date']", 'object_name': 'Show'},
            'ads_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'ages': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'attendance': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'commission': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'commission_check_no': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'commission_percentage': ('django.db.models.fields.IntegerField', [], {'default': '10', 'null': 'True', 'blank': 'True'}),
            'commission_withheld': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'costs_itemized': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'date': ('django.db.models.fields.DateTimeField', [], {}),
            'doors_time': ('django.db.models.fields.TimeField', [], {'null': 'True', 'blank': 'True'}),
            'fb_event': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'fee': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'food_buyout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'gross': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'gross_itemized': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'gross_method': ('django.db.models.fields.CharField', [], {'default': "'cash'", 'max_length': '100', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'in_ears_check_no': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'in_ears_cost': ('django.db.models.fields.IntegerField', [], {'default': '130', 'null': 'True', 'blank': 'True'}),
            'lodging_buyout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'net': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'notes': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'opener': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'other_buyout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'other_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'payee_check_no': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'payer': ('django.db.models.fields.CharField', [], {'default': "'client'", 'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'payout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'poster': ('django.db.models.fields.files.FileField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'print_ship_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'public': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'settlement_sheet': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'sound_check_no': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'sound_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'subs': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'ticket_price': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'ticket_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'to_account': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'travel_buyout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'venue': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'venue'", 'to': u"orm['shows.Venue']"})
        },
        u'shows.venue': {
            'Meta': {'object_name': 'Venue'},
            'address1': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'address2': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'capacity': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'contact': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'country': ('django.db.models.fields.CharField', [], {'default': "'U.S.A.'", 'max_length': '100', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ltlng': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'notes': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'phone': ('django.contrib.localflavor.us.models.PhoneNumberField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'state': ('django.contrib.localflavor.us.models.USStateField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'venue_image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'blank': 'True'}),
            'venue_name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'website': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'})
        },
        u'songs.setlist': {
            'Meta': {'object_name': 'Setlist'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'length_of_set': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'number_of_sets': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'setlist'", 'to': u"orm['shows.Show']"}),
            'songs': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['songs.Song']", 'through': u"orm['songs.SetlistSong']", 'symmetrical': 'False'})
        },
        u'songs.setlistsong': {
            'Meta': {'object_name': 'SetlistSong'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'order': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'setlist': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['songs.Setlist']"}),
            'song': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['songs.Song']"}),
            'transition_to_next': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        },
        u'songs.song': {
            'Meta': {'object_name': 'Song'},
            'display': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'foh_notes': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'key': ('django.db.models.fields.CharField', [], {'max_length': '64', 'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'original_album': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'original_artist': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'release_year': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'setlist_notes': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'singer': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'singer'", 'null': 'True', 'symmetrical': 'False', 'to': u"orm['members.Member']"}),
            'tempo': ('django.db.models.fields.CharField', [], {'max_length': '64', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['songs']