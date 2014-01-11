# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Album'
        db.create_table(u'media_album', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('public', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal(u'media', ['Album'])

        # Adding M2M table for field show on 'Album'
        m2m_table_name = db.shorten_name(u'media_album_show')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('album', models.ForeignKey(orm[u'media.album'], null=False)),
            ('show', models.ForeignKey(orm[u'shows.show'], null=False))
        ))
        db.create_unique(m2m_table_name, ['album_id', 'show_id'])

        # Adding model 'Tag'
        db.create_table(u'media_tag', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('tag', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal(u'media', ['Tag'])

        # Adding model 'Image'
        db.create_table(u'media_image', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=60, null=True, blank=True)),
            ('image', self.gf('django.db.models.fields.files.FileField')(max_length=100)),
            ('thumbnail', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('width', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('height', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('thumbnail2', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal(u'media', ['Image'])

        # Adding M2M table for field tags on 'Image'
        m2m_table_name = db.shorten_name(u'media_image_tags')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('image', models.ForeignKey(orm[u'media.image'], null=False)),
            ('tag', models.ForeignKey(orm[u'media.tag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['image_id', 'tag_id'])

        # Adding M2M table for field show on 'Image'
        m2m_table_name = db.shorten_name(u'media_image_show')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('image', models.ForeignKey(orm[u'media.image'], null=False)),
            ('show', models.ForeignKey(orm[u'shows.show'], null=False))
        ))
        db.create_unique(m2m_table_name, ['image_id', 'show_id'])

        # Adding M2M table for field albums on 'Image'
        m2m_table_name = db.shorten_name(u'media_image_albums')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('image', models.ForeignKey(orm[u'media.image'], null=False)),
            ('album', models.ForeignKey(orm[u'media.album'], null=False))
        ))
        db.create_unique(m2m_table_name, ['image_id', 'album_id'])

        # Adding model 'Video'
        db.create_table(u'media_video', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=60, null=True, blank=True)),
            ('url', self.gf('django.db.models.fields.URLField')(max_length=200)),
            ('embed_type', self.gf('django.db.models.fields.CharField')(default='yt', max_length=10, null=True, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal(u'media', ['Video'])

        # Adding M2M table for field tags on 'Video'
        m2m_table_name = db.shorten_name(u'media_video_tags')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('video', models.ForeignKey(orm[u'media.video'], null=False)),
            ('tag', models.ForeignKey(orm[u'media.tag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['video_id', 'tag_id'])

        # Adding M2M table for field show on 'Video'
        m2m_table_name = db.shorten_name(u'media_video_show')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('video', models.ForeignKey(orm[u'media.video'], null=False)),
            ('show', models.ForeignKey(orm[u'shows.show'], null=False))
        ))
        db.create_unique(m2m_table_name, ['video_id', 'show_id'])

        # Adding M2M table for field albums on 'Video'
        m2m_table_name = db.shorten_name(u'media_video_albums')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('video', models.ForeignKey(orm[u'media.video'], null=False)),
            ('album', models.ForeignKey(orm[u'media.album'], null=False))
        ))
        db.create_unique(m2m_table_name, ['video_id', 'album_id'])


    def backwards(self, orm):
        # Deleting model 'Album'
        db.delete_table(u'media_album')

        # Removing M2M table for field show on 'Album'
        db.delete_table(db.shorten_name(u'media_album_show'))

        # Deleting model 'Tag'
        db.delete_table(u'media_tag')

        # Deleting model 'Image'
        db.delete_table(u'media_image')

        # Removing M2M table for field tags on 'Image'
        db.delete_table(db.shorten_name(u'media_image_tags'))

        # Removing M2M table for field show on 'Image'
        db.delete_table(db.shorten_name(u'media_image_show'))

        # Removing M2M table for field albums on 'Image'
        db.delete_table(db.shorten_name(u'media_image_albums'))

        # Deleting model 'Video'
        db.delete_table(u'media_video')

        # Removing M2M table for field tags on 'Video'
        db.delete_table(db.shorten_name(u'media_video_tags'))

        # Removing M2M table for field show on 'Video'
        db.delete_table(db.shorten_name(u'media_video_show'))

        # Removing M2M table for field albums on 'Video'
        db.delete_table(db.shorten_name(u'media_video_albums'))


    models = {
        u'media.album': {
            'Meta': {'object_name': 'Album'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'public': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'show': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['shows.Show']", 'symmetrical': 'False', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'media.image': {
            'Meta': {'object_name': 'Image'},
            'albums': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['media.Album']", 'symmetrical': 'False', 'blank': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'height': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.FileField', [], {'max_length': '100'}),
            'show': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['shows.Show']", 'symmetrical': 'False', 'blank': 'True'}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['media.Tag']", 'symmetrical': 'False', 'blank': 'True'}),
            'thumbnail': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'thumbnail2': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '60', 'null': 'True', 'blank': 'True'}),
            'width': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'media.tag': {
            'Meta': {'object_name': 'Tag'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tag': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'media.video': {
            'Meta': {'object_name': 'Video'},
            'albums': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['media.Album']", 'symmetrical': 'False', 'blank': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'embed_type': ('django.db.models.fields.CharField', [], {'default': "'yt'", 'max_length': '10', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'show': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['shows.Show']", 'symmetrical': 'False', 'blank': 'True'}),
            'tags': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['media.Tag']", 'symmetrical': 'False', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '60', 'null': 'True', 'blank': 'True'}),
            'url': ('django.db.models.fields.URLField', [], {'max_length': '200'})
        },
        u'shows.show': {
            'Meta': {'ordering': "['date']", 'object_name': 'Show'},
            'ads_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'ages': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'commission': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateTimeField', [], {}),
            'doors_time': ('django.db.models.fields.TimeField', [], {'null': 'True', 'blank': 'True'}),
            'gross': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'in_ears_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'net': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'notes': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'opener': ('django.db.models.fields.CharField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'other_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'payout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'print_ship_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'public': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'sound_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'ticket_price': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'ticket_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'null': 'True', 'blank': 'True'}),
            'to_account': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '10', 'decimal_places': '2', 'blank': 'True'}),
            'venue': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'venue'", 'to': u"orm['shows.Venue']"})
        },
        u'shows.venue': {
            'Meta': {'object_name': 'Venue'},
            'address1': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'address2': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
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

    complete_apps = ['media']