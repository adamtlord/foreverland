# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Member.address'
        db.add_column(u'members_member', 'address',
                      self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Member.city'
        db.add_column(u'members_member', 'city',
                      self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Member.state'
        db.add_column(u'members_member', 'state',
                      self.gf('localflavor.us.models.USStateField')(max_length=2, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Member.zip_code'
        db.add_column(u'members_member', 'zip_code',
                      self.gf('django.db.models.fields.CharField')(max_length=20, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Member.phone'
        db.add_column(u'members_member', 'phone',
                      self.gf('localflavor.us.models.PhoneNumberField')(max_length=20, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Member.ssn'
        db.add_column(u'members_member', 'ssn',
                      self.gf('django.db.models.fields.CharField')(max_length=16, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sub.address'
        db.add_column(u'members_sub', 'address',
                      self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sub.city'
        db.add_column(u'members_sub', 'city',
                      self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sub.state'
        db.add_column(u'members_sub', 'state',
                      self.gf('localflavor.us.models.USStateField')(max_length=2, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sub.zip_code'
        db.add_column(u'members_sub', 'zip_code',
                      self.gf('django.db.models.fields.CharField')(max_length=20, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sub.phone'
        db.add_column(u'members_sub', 'phone',
                      self.gf('localflavor.us.models.PhoneNumberField')(max_length=20, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sub.ssn'
        db.add_column(u'members_sub', 'ssn',
                      self.gf('django.db.models.fields.CharField')(max_length=16, null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Member.address'
        db.delete_column(u'members_member', 'address')

        # Deleting field 'Member.city'
        db.delete_column(u'members_member', 'city')

        # Deleting field 'Member.state'
        db.delete_column(u'members_member', 'state')

        # Deleting field 'Member.zip_code'
        db.delete_column(u'members_member', 'zip_code')

        # Deleting field 'Member.phone'
        db.delete_column(u'members_member', 'phone')

        # Deleting field 'Member.ssn'
        db.delete_column(u'members_member', 'ssn')

        # Deleting field 'Sub.address'
        db.delete_column(u'members_sub', 'address')

        # Deleting field 'Sub.city'
        db.delete_column(u'members_sub', 'city')

        # Deleting field 'Sub.state'
        db.delete_column(u'members_sub', 'state')

        # Deleting field 'Sub.zip_code'
        db.delete_column(u'members_sub', 'zip_code')

        # Deleting field 'Sub.phone'
        db.delete_column(u'members_sub', 'phone')

        # Deleting field 'Sub.ssn'
        db.delete_column(u'members_sub', 'ssn')


    models = {
        u'members.member': {
            'Meta': {'object_name': 'Member'},
            'active': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'address': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'bio': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'display_first': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'display_last': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'dob': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'instrument': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'join_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'middle_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'phone': ('localflavor.us.models.PhoneNumberField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'section': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'ssn': ('django.db.models.fields.CharField', [], {'max_length': '16', 'null': 'True', 'blank': 'True'}),
            'state': ('localflavor.us.models.USStateField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'})
        },
        u'members.sub': {
            'Meta': {'object_name': 'Sub'},
            'address': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'instrument': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '50', 'null': 'True', 'blank': 'True'}),
            'phone': ('localflavor.us.models.PhoneNumberField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'ssn': ('django.db.models.fields.CharField', [], {'max_length': '16', 'null': 'True', 'blank': 'True'}),
            'state': ('localflavor.us.models.USStateField', [], {'max_length': '2', 'null': 'True', 'blank': 'True'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['members']