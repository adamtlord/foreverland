# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Tour'
        db.create_table(u'shows_tour', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200, null=True, blank=True)),
        ))
        db.send_create_signal(u'shows', ['Tour'])


    def backwards(self, orm):
        # Deleting model 'Tour'
        db.delete_table(u'shows_tour')


    models = {
        u'fidouche.agent': {
            'Meta': {'object_name': 'Agent'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'agency': ('django.db.models.fields.CharField', [], {'max_length': '128', 'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'phone': ('django.contrib.localflavor.us.models.PhoneNumberField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'ssn': ('django.db.models.fields.CharField', [], {'max_length': '16', 'null': 'True', 'blank': 'True'}),
            'state': ('django.contrib.localflavor.us.models.USStateField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'})
        },
        u'shows.show': {
            'Meta': {'ordering': "['date']", 'object_name': 'Show'},
            'ads_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'agent': ('django.db.models.fields.related.ForeignKey', [], {'blank': 'True', 'related_name': "'gig_agent'", 'null': 'True', 'to': u"orm['fidouche.Agent']"}),
            'ages': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'attendance': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'commission': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'commission_check_no': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'commission_paid': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'commission_percentage': ('django.db.models.fields.IntegerField', [], {'default': '10', 'null': 'True', 'blank': 'True'}),
            'commission_withheld': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
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
        u'shows.tour': {
            'Meta': {'object_name': 'Tour'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'})
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
        }
    }

    complete_apps = ['shows']