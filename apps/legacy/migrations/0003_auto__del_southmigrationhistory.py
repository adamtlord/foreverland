# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'SouthMigrationhistory'
        db.delete_table(u'south_migrationhistory')


    def backwards(self, orm):
        # Adding model 'SouthMigrationhistory'
        db.create_table(u'south_migrationhistory', (
            ('applied', self.gf('django.db.models.fields.DateTimeField')()),
            ('app_name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('migration', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
        ))
        db.send_create_signal(u'legacy', ['SouthMigrationhistory'])


    models = {
        u'legacy.wpbwbpscategories': {
            'Meta': {'object_name': 'WpBwbpsCategories', 'db_table': "u'wp_bwbps_categories'"},
            'category_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'image_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'tag_name': ('django.db.models.fields.CharField', [], {'max_length': '250L', 'blank': 'True'}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'legacy.wpbwbpscustomdata': {
            'Meta': {'object_name': 'WpBwbpsCustomdata', 'db_table': "u'wp_bwbps_customdata'"},
            'bwbps_status': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'image_id': ('django.db.models.fields.IntegerField', [], {}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'legacy.wpbwbpsfavorites': {
            'Meta': {'object_name': 'WpBwbpsFavorites', 'db_table': "u'wp_bwbps_favorites'"},
            'favorite_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'image_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {}),
            'user_id': ('django.db.models.fields.BigIntegerField', [], {})
        },
        u'legacy.wpbwbpsfields': {
            'Meta': {'object_name': 'WpBwbpsFields', 'db_table': "u'wp_bwbps_fields'"},
            'auto_capitalize': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'date_format': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'default_val': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'field_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'field_name': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'}),
            'form_id': ('django.db.models.fields.IntegerField', [], {}),
            'html_filter': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'keyboard_type': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'multi_val': ('django.db.models.fields.IntegerField', [], {}),
            'numeric_field': ('django.db.models.fields.IntegerField', [], {}),
            'seq': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {}),
            'type': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'legacy.wpbwbpsforms': {
            'Meta': {'object_name': 'WpBwbpsForms', 'db_table': "u'wp_bwbps_forms'"},
            'category': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'css': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'fields_used': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'form': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'form_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'form_name': ('django.db.models.fields.CharField', [], {'max_length': '30L', 'blank': 'True'})
        },
        u'legacy.wpbwbpsgalleries': {
            'Meta': {'object_name': 'WpBwbpsGalleries', 'db_table': "u'wp_bwbps_galleries'"},
            'add_text': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'allow_no_image': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'anchor_class': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'caption': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'caption_template': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'contrib_role': ('django.db.models.fields.IntegerField', [], {}),
            'cover_imageid': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'created_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'custom_formid': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'default_image': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'gallery_description': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'gallery_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'gallery_name': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'gallery_type': ('django.db.models.fields.IntegerField', [], {}),
            'hide_toggle_ratings': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'image_aspect': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'image_height': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'image_width': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'img_class': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'img_count': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'img_perpage': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'img_perrow': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'img_rel': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'img_status': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'layout_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'max_user_uploads': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'medium_aspect': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'medium_height': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'medium_width': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'mini_aspect': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'mini_height': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'mini_width': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'nofollow_caption': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'pext_insert_setid': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'poll_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'post_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rating_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show_caption': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show_imgcaption': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'sort_field': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'sort_order': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'suppress_no_image': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'thumb_aspect': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'thumb_height': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'thumb_width': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {}),
            'upload_form_caption': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'uploads_period': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'use_customfields': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'use_customform': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'legacy.wpbwbpsimageratings': {
            'Meta': {'object_name': 'WpBwbpsImageratings', 'db_table': "u'wp_bwbps_imageratings'"},
            'comment': ('django.db.models.fields.CharField', [], {'max_length': '250L', 'blank': 'True'}),
            'gallery_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'image_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'poll_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rating': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rating_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'status': ('django.db.models.fields.IntegerField', [], {}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {}),
            'user_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'user_ip': ('django.db.models.fields.CharField', [], {'max_length': '30L', 'blank': 'True'})
        },
        u'legacy.wpbwbpsimages': {
            'Meta': {'object_name': 'WpBwbpsImages', 'db_table': "u'wp_bwbps_images'"},
            'alerted': ('django.db.models.fields.IntegerField', [], {}),
            'avg_rating': ('django.db.models.fields.FloatField', [], {}),
            'comment_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'created_date': ('django.db.models.fields.DateTimeField', [], {'null': 'True', 'blank': 'True'}),
            'custom_fields': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'favorites_cnt': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'file_name': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'file_type': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'file_url': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'gallery_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'geolat': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'geolong': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'image_caption': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'image_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'image_name': ('django.db.models.fields.CharField', [], {'max_length': '250L', 'blank': 'True'}),
            'image_url': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'img_attribution': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'img_license': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'medium_url': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'meta_data': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'mini_url': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'post_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rating_cnt': ('django.db.models.fields.BigIntegerField', [], {}),
            'seq': ('django.db.models.fields.BigIntegerField', [], {}),
            'status': ('django.db.models.fields.IntegerField', [], {}),
            'thumb_url': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'updated_by': ('django.db.models.fields.BigIntegerField', [], {}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {}),
            'url': ('django.db.models.fields.CharField', [], {'max_length': '250L', 'blank': 'True'}),
            'user_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'votes_cnt': ('django.db.models.fields.BigIntegerField', [], {}),
            'votes_sum': ('django.db.models.fields.BigIntegerField', [], {}),
            'wp_attach_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'legacy.wpbwbpslayouts': {
            'Meta': {'object_name': 'WpBwbpsLayouts', 'db_table': "u'wp_bwbps_layouts'"},
            'alt_layout': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'cells_perrow': ('django.db.models.fields.IntegerField', [], {}),
            'css': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'fields_used': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'footer_layout': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'layout': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'layout_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'layout_name': ('django.db.models.fields.CharField', [], {'max_length': '30L', 'blank': 'True'}),
            'layout_type': ('django.db.models.fields.IntegerField', [], {}),
            'lists': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'pagination_class': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'post_type': ('django.db.models.fields.CharField', [], {'max_length': '20L', 'blank': 'True'}),
            'wrapper': ('django.db.models.fields.TextField', [], {'blank': 'True'})
        },
        u'legacy.wpbwbpslookup': {
            'Meta': {'object_name': 'WpBwbpsLookup', 'db_table': "u'wp_bwbps_lookup'"},
            'field_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'seq': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'value': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'})
        },
        u'legacy.wpbwbpsparams': {
            'Meta': {'object_name': 'WpBwbpsParams', 'db_table': "u'wp_bwbps_params'"},
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'num_value': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'param': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'param_group': ('django.db.models.fields.CharField', [], {'max_length': '20L', 'blank': 'True'}),
            'text_value': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {}),
            'user_ip': ('django.db.models.fields.CharField', [], {'max_length': '30L', 'blank': 'True'})
        },
        u'legacy.wpbwbpsratingssummary': {
            'Meta': {'object_name': 'WpBwbpsRatingssummary', 'db_table': "u'wp_bwbps_ratingssummary'"},
            'avg_rating': ('django.db.models.fields.FloatField', [], {}),
            'gallery_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'image_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'poll_id': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rating_cnt': ('django.db.models.fields.BigIntegerField', [], {}),
            'rating_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'updated_date': ('django.db.models.fields.DateTimeField', [], {})
        },
        u'legacy.wpcommentmeta': {
            'Meta': {'object_name': 'WpCommentmeta', 'db_table': "u'wp_commentmeta'"},
            'comment_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'meta_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'meta_key': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'meta_value': ('django.db.models.fields.TextField', [], {'blank': 'True'})
        },
        u'legacy.wpcomments': {
            'Meta': {'object_name': 'WpComments', 'db_table': "u'wp_comments'"},
            'comment_agent': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'comment_approved': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'comment_author': ('django.db.models.fields.TextField', [], {}),
            'comment_author_email': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'comment_author_ip': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'db_column': "u'comment_author_IP'"}),
            'comment_author_url': ('django.db.models.fields.CharField', [], {'max_length': '200L'}),
            'comment_content': ('django.db.models.fields.TextField', [], {}),
            'comment_date': ('django.db.models.fields.DateTimeField', [], {}),
            'comment_date_gmt': ('django.db.models.fields.DateTimeField', [], {}),
            'comment_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True', 'db_column': "u'comment_ID'"}),
            'comment_karma': ('django.db.models.fields.IntegerField', [], {}),
            'comment_parent': ('django.db.models.fields.BigIntegerField', [], {}),
            'comment_post_id': ('django.db.models.fields.BigIntegerField', [], {'db_column': "u'comment_post_ID'"}),
            'comment_type': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'user_id': ('django.db.models.fields.BigIntegerField', [], {})
        },
        u'legacy.wpgigpressartists': {
            'Meta': {'object_name': 'WpGigpressArtists', 'db_table': "u'wp_gigpress_artists'"},
            'artist_alpha': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'artist_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'artist_name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'artist_order': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'artist_url': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'})
        },
        u'legacy.wpgigpressshows': {
            'Meta': {'object_name': 'WpGigpressShows', 'db_table': "u'wp_gigpress_shows'"},
            'show_address': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_ages': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_artist_id': ('django.db.models.fields.IntegerField', [], {}),
            'show_country': ('django.db.models.fields.CharField', [], {'max_length': '2L', 'blank': 'True'}),
            'show_date': ('django.db.models.fields.DateField', [], {}),
            'show_expire': ('django.db.models.fields.DateField', [], {}),
            'show_external_url': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'show_locale': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_multi': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show_notes': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'show_price': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_related': ('django.db.models.fields.BigIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show_status': ('django.db.models.fields.CharField', [], {'max_length': '32L', 'blank': 'True'}),
            'show_time': ('django.db.models.fields.TextField', [], {}),
            'show_tix_phone': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_tix_url': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_tour_id': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show_tour_restore': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'show_venue': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_venue_id': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.WpGigpressVenues']"}),
            'show_venue_phone': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'show_venue_url': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'})
        },
        u'legacy.wpgigpresstours': {
            'Meta': {'object_name': 'WpGigpressTours', 'db_table': "u'wp_gigpress_tours'"},
            'tour_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'tour_name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'tour_status': ('django.db.models.fields.CharField', [], {'max_length': '32L', 'blank': 'True'})
        },
        u'legacy.wpgigpressvenues': {
            'Meta': {'object_name': 'WpGigpressVenues', 'db_table': "u'wp_gigpress_venues'"},
            'venue_address': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'venue_city': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'venue_country': ('django.db.models.fields.CharField', [], {'max_length': '2L'}),
            'venue_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'venue_name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'venue_phone': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'venue_postal_code': ('django.db.models.fields.CharField', [], {'max_length': '32L', 'blank': 'True'}),
            'venue_state': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'venue_url': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'})
        },
        u'legacy.wplinks': {
            'Meta': {'object_name': 'WpLinks', 'db_table': "u'wp_links'"},
            'link_description': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'link_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'link_image': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'link_name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'link_notes': ('django.db.models.fields.TextField', [], {}),
            'link_owner': ('django.db.models.fields.BigIntegerField', [], {}),
            'link_rating': ('django.db.models.fields.IntegerField', [], {}),
            'link_rel': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'link_rss': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'link_target': ('django.db.models.fields.CharField', [], {'max_length': '25L'}),
            'link_updated': ('django.db.models.fields.DateTimeField', [], {}),
            'link_url': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'link_visible': ('django.db.models.fields.CharField', [], {'max_length': '20L'})
        },
        u'legacy.wpnggalbum': {
            'Meta': {'object_name': 'WpNggAlbum', 'db_table': "u'wp_ngg_album'"},
            'albumdesc': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'pageid': ('django.db.models.fields.BigIntegerField', [], {}),
            'previewpic': ('django.db.models.fields.BigIntegerField', [], {}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'sortorder': ('django.db.models.fields.TextField', [], {})
        },
        u'legacy.wpnggcffields': {
            'Meta': {'object_name': 'WpNggcfFields', 'db_table': "u'wp_nggcf_fields'"},
            'dateadded': ('django.db.models.fields.DateTimeField', [], {}),
            'drop_options': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'field_name': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'field_type': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ngg_type': ('django.db.models.fields.IntegerField', [], {}),
            'sid': ('django.db.models.fields.BigIntegerField', [], {'unique': 'True'})
        },
        u'legacy.wpnggcffieldslink': {
            'Meta': {'object_name': 'WpNggcfFieldsLink', 'db_table': "u'wp_nggcf_fields_link'"},
            'field_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'gid': ('django.db.models.fields.BigIntegerField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'sid': ('django.db.models.fields.BigIntegerField', [], {'unique': 'True'})
        },
        u'legacy.wpnggcffieldvalues': {
            'Meta': {'object_name': 'WpNggcfFieldValues', 'db_table': "u'wp_nggcf_field_values'"},
            'dateadded': ('django.db.models.fields.DateTimeField', [], {}),
            'fid': ('django.db.models.fields.BigIntegerField', [], {}),
            'field_value': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ngg_type': ('django.db.models.fields.IntegerField', [], {}),
            'pid': ('django.db.models.fields.BigIntegerField', [], {}),
            'sid': ('django.db.models.fields.BigIntegerField', [], {'unique': 'True'})
        },
        u'legacy.wpngggallery': {
            'Meta': {'object_name': 'WpNggGallery', 'db_table': "u'wp_ngg_gallery'"},
            'author': ('django.db.models.fields.BigIntegerField', [], {}),
            'galdesc': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'gid': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'pageid': ('django.db.models.fields.BigIntegerField', [], {}),
            'path': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'previewpic': ('django.db.models.fields.BigIntegerField', [], {}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'title': ('django.db.models.fields.TextField', [], {'blank': 'True'})
        },
        u'legacy.wpnggpictures': {
            'Meta': {'object_name': 'WpNggPictures', 'db_table': "u'wp_ngg_pictures'"},
            'alttext': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'exclude': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'filename': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'galleryid': ('django.db.models.fields.BigIntegerField', [], {}),
            'image_slug': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'imagedate': ('django.db.models.fields.DateTimeField', [], {}),
            'meta_data': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'pid': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'post_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'sortorder': ('django.db.models.fields.BigIntegerField', [], {})
        },
        u'legacy.wpoptions': {
            'Meta': {'object_name': 'WpOptions', 'db_table': "u'wp_options'"},
            'autoload': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'option_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'option_name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '64L'}),
            'option_value': ('django.db.models.fields.TextField', [], {})
        },
        u'legacy.wppostmeta': {
            'Meta': {'object_name': 'WpPostmeta', 'db_table': "u'wp_postmeta'"},
            'meta_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'meta_key': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'meta_value': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'post_id': ('django.db.models.fields.BigIntegerField', [], {})
        },
        u'legacy.wpposts': {
            'Meta': {'object_name': 'WpPosts', 'db_table': "u'wp_posts'"},
            'comment_count': ('django.db.models.fields.BigIntegerField', [], {}),
            'comment_status': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'guid': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True', 'db_column': "u'ID'"}),
            'menu_order': ('django.db.models.fields.IntegerField', [], {}),
            'ping_status': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'pinged': ('django.db.models.fields.TextField', [], {}),
            'post_author': ('django.db.models.fields.BigIntegerField', [], {}),
            'post_content': ('django.db.models.fields.TextField', [], {}),
            'post_content_filtered': ('django.db.models.fields.TextField', [], {}),
            'post_date': ('django.db.models.fields.DateTimeField', [], {}),
            'post_date_gmt': ('django.db.models.fields.DateTimeField', [], {}),
            'post_excerpt': ('django.db.models.fields.TextField', [], {}),
            'post_mime_type': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'post_modified': ('django.db.models.fields.DateTimeField', [], {}),
            'post_modified_gmt': ('django.db.models.fields.DateTimeField', [], {}),
            'post_name': ('django.db.models.fields.CharField', [], {'max_length': '200L'}),
            'post_parent': ('django.db.models.fields.BigIntegerField', [], {}),
            'post_password': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'post_status': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'post_title': ('django.db.models.fields.TextField', [], {}),
            'post_type': ('django.db.models.fields.CharField', [], {'max_length': '20L'}),
            'to_ping': ('django.db.models.fields.TextField', [], {})
        },
        u'legacy.wprandomtext': {
            'Meta': {'object_name': 'WpRandomtext', 'db_table': "u'wp_randomtext'"},
            'category': ('django.db.models.fields.CharField', [], {'max_length': '32L'}),
            'randomtext_id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'text': ('django.db.models.fields.TextField', [], {}),
            'timestamp': ('django.db.models.fields.DateTimeField', [], {}),
            'user_id': ('django.db.models.fields.IntegerField', [], {}),
            'visible': ('django.db.models.fields.CharField', [], {'max_length': '3L'})
        },
        u'legacy.wptermrelationships': {
            'Meta': {'object_name': 'WpTermRelationships', 'db_table': "u'wp_term_relationships'"},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'object_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'term_order': ('django.db.models.fields.IntegerField', [], {}),
            'term_taxonomy_id': ('django.db.models.fields.BigIntegerField', [], {})
        },
        u'legacy.wpterms': {
            'Meta': {'object_name': 'WpTerms', 'db_table': "u'wp_terms'"},
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200L'}),
            'slug': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '200L'}),
            'term_group': ('django.db.models.fields.BigIntegerField', [], {}),
            'term_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'})
        },
        u'legacy.wptermtaxonomy': {
            'Meta': {'object_name': 'WpTermTaxonomy', 'db_table': "u'wp_term_taxonomy'"},
            'count': ('django.db.models.fields.BigIntegerField', [], {}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'parent': ('django.db.models.fields.BigIntegerField', [], {}),
            'taxonomy': ('django.db.models.fields.CharField', [], {'max_length': '32L'}),
            'term_id': ('django.db.models.fields.BigIntegerField', [], {}),
            'term_taxonomy_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'})
        },
        u'legacy.wpusermeta': {
            'Meta': {'object_name': 'WpUsermeta', 'db_table': "u'wp_usermeta'"},
            'meta_key': ('django.db.models.fields.CharField', [], {'max_length': '255L', 'blank': 'True'}),
            'meta_value': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'umeta_id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True'}),
            'user_id': ('django.db.models.fields.BigIntegerField', [], {})
        },
        u'legacy.wpusers': {
            'Meta': {'object_name': 'WpUsers', 'db_table': "u'wp_users'"},
            'display_name': ('django.db.models.fields.CharField', [], {'max_length': '250L'}),
            'id': ('django.db.models.fields.BigIntegerField', [], {'primary_key': 'True', 'db_column': "u'ID'"}),
            'user_activation_key': ('django.db.models.fields.CharField', [], {'max_length': '60L'}),
            'user_email': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'user_login': ('django.db.models.fields.CharField', [], {'max_length': '60L'}),
            'user_nicename': ('django.db.models.fields.CharField', [], {'max_length': '50L'}),
            'user_pass': ('django.db.models.fields.CharField', [], {'max_length': '64L'}),
            'user_registered': ('django.db.models.fields.DateTimeField', [], {}),
            'user_status': ('django.db.models.fields.IntegerField', [], {}),
            'user_url': ('django.db.models.fields.CharField', [], {'max_length': '100L'})
        },
        u'legacy.wpwpb2dexcludedfiles': {
            'Meta': {'object_name': 'WpWpb2DExcludedFiles', 'db_table': "u'wp_wpb2d_excluded_files'"},
            'file': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255L'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'isdir': ('django.db.models.fields.IntegerField', [], {})
        },
        u'legacy.wpwpb2doptions': {
            'Meta': {'object_name': 'WpWpb2DOptions', 'db_table': "u'wp_wpb2d_options'"},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50L'}),
            'value': ('django.db.models.fields.CharField', [], {'max_length': '255L'})
        },
        u'legacy.wpwpb2dpremiumextensions': {
            'Meta': {'object_name': 'WpWpb2DPremiumExtensions', 'db_table': "u'wp_wpb2d_premium_extensions'"},
            'file': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '50L'})
        },
        u'legacy.wpwpb2dprocessedfiles': {
            'Meta': {'object_name': 'WpWpb2DProcessedFiles', 'db_table': "u'wp_wpb2d_processed_files'"},
            'file': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255L'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'offset': ('django.db.models.fields.IntegerField', [], {}),
            'uploadid': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'})
        }
    }

    complete_apps = ['legacy']