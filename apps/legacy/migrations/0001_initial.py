# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'AccountsUserprofile'
        db.create_table(u'accounts_userprofile', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthUser'], unique=True)),
            ('newsletter_subscribe', self.gf('django.db.models.fields.IntegerField')()),
            ('picture', self.gf('django.db.models.fields.CharField')(max_length=100L)),
        ))
        db.send_create_signal(u'legacy', ['AccountsUserprofile'])

        # Adding model 'AhmFiles'
        db.create_table(u'ahm_files', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('file', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('password', self.gf('django.db.models.fields.CharField')(max_length=40L)),
            ('download_count', self.gf('django.db.models.fields.IntegerField')()),
            ('access', self.gf('django.db.models.fields.CharField')(max_length=6L)),
            ('show_counter', self.gf('django.db.models.fields.IntegerField')()),
            ('link_label', self.gf('django.db.models.fields.CharField')(max_length=255L)),
        ))
        db.send_create_signal(u'legacy', ['AhmFiles'])

        # Adding model 'AuthGroup'
        db.create_table(u'auth_group', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=80L)),
        ))
        db.send_create_signal(u'legacy', ['AuthGroup'])

        # Adding model 'AuthGroupPermissions'
        db.create_table(u'auth_group_permissions', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('group', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthGroup'])),
            ('permission', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthPermission'])),
        ))
        db.send_create_signal(u'legacy', ['AuthGroupPermissions'])

        # Adding model 'AuthPermission'
        db.create_table(u'auth_permission', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50L)),
            ('content_type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.DjangoContentType'])),
            ('codename', self.gf('django.db.models.fields.CharField')(max_length=100L)),
        ))
        db.send_create_signal(u'legacy', ['AuthPermission'])

        # Adding model 'AuthUser'
        db.create_table(u'auth_user', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('password', self.gf('django.db.models.fields.CharField')(max_length=128L)),
            ('last_login', self.gf('django.db.models.fields.DateTimeField')()),
            ('is_superuser', self.gf('django.db.models.fields.IntegerField')()),
            ('username', self.gf('django.db.models.fields.CharField')(unique=True, max_length=30L)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=30L)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=30L)),
            ('email', self.gf('django.db.models.fields.CharField')(max_length=75L)),
            ('is_staff', self.gf('django.db.models.fields.IntegerField')()),
            ('is_active', self.gf('django.db.models.fields.IntegerField')()),
            ('date_joined', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['AuthUser'])

        # Adding model 'AuthUserGroups'
        db.create_table(u'auth_user_groups', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthUser'])),
            ('group', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthGroup'])),
        ))
        db.send_create_signal(u'legacy', ['AuthUserGroups'])

        # Adding model 'AuthUserUserPermissions'
        db.create_table(u'auth_user_user_permissions', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthUser'])),
            ('permission', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthPermission'])),
        ))
        db.send_create_signal(u'legacy', ['AuthUserUserPermissions'])

        # Adding model 'DjangoAdminLog'
        db.create_table(u'django_admin_log', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('action_time', self.gf('django.db.models.fields.DateTimeField')()),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthUser'])),
            ('content_type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.DjangoContentType'], null=True, blank=True)),
            ('object_id', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('object_repr', self.gf('django.db.models.fields.CharField')(max_length=200L)),
            ('action_flag', self.gf('django.db.models.fields.IntegerField')()),
            ('change_message', self.gf('django.db.models.fields.TextField')()),
        ))
        db.send_create_signal(u'legacy', ['DjangoAdminLog'])

        # Adding model 'DjangoContentType'
        db.create_table(u'django_content_type', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('app_label', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('model', self.gf('django.db.models.fields.CharField')(max_length=100L)),
        ))
        db.send_create_signal(u'legacy', ['DjangoContentType'])

        # Adding model 'DjangoSession'
        db.create_table(u'django_session', (
            ('session_key', self.gf('django.db.models.fields.CharField')(max_length=40L, primary_key=True)),
            ('session_data', self.gf('django.db.models.fields.TextField')()),
            ('expire_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['DjangoSession'])

        # Adding model 'DjangoSite'
        db.create_table(u'django_site', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('domain', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50L)),
        ))
        db.send_create_signal(u'legacy', ['DjangoSite'])

        # Adding model 'MarketingTestimonial'
        db.create_table(u'marketing_testimonial', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('quote', self.gf('django.db.models.fields.TextField')()),
            ('source', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('show', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.ShowsShow'], null=True, blank=True)),
            ('featured', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['MarketingTestimonial'])

        # Adding model 'MediaAlbum'
        db.create_table(u'media_album', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('public', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['MediaAlbum'])

        # Adding model 'MediaAlbumShow'
        db.create_table(u'media_album_show', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('album', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaAlbum'])),
            ('show', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.ShowsShow'])),
        ))
        db.send_create_signal(u'legacy', ['MediaAlbumShow'])

        # Adding model 'MediaImage'
        db.create_table(u'media_image', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=60L, blank=True)),
            ('image', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('thumbnail', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')()),
            ('width', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('height', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('thumbnail2', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['MediaImage'])

        # Adding model 'MediaImageAlbums'
        db.create_table(u'media_image_albums', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('image', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaImage'])),
            ('album', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaAlbum'])),
        ))
        db.send_create_signal(u'legacy', ['MediaImageAlbums'])

        # Adding model 'MediaImageShow'
        db.create_table(u'media_image_show', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('image', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaImage'])),
            ('show', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.ShowsShow'])),
        ))
        db.send_create_signal(u'legacy', ['MediaImageShow'])

        # Adding model 'MediaImageTags'
        db.create_table(u'media_image_tags', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('image', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaImage'])),
            ('tag', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaTag'])),
        ))
        db.send_create_signal(u'legacy', ['MediaImageTags'])

        # Adding model 'MediaTag'
        db.create_table(u'media_tag', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('tag', self.gf('django.db.models.fields.CharField')(max_length=50L)),
        ))
        db.send_create_signal(u'legacy', ['MediaTag'])

        # Adding model 'MediaVideo'
        db.create_table(u'media_video', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=60L, blank=True)),
            ('url', self.gf('django.db.models.fields.CharField')(max_length=200L)),
            ('embed_type', self.gf('django.db.models.fields.CharField')(max_length=10L, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['MediaVideo'])

        # Adding model 'MediaVideoAlbums'
        db.create_table(u'media_video_albums', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('video', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaVideo'])),
            ('album', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaAlbum'])),
        ))
        db.send_create_signal(u'legacy', ['MediaVideoAlbums'])

        # Adding model 'MediaVideoShow'
        db.create_table(u'media_video_show', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('video', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaVideo'])),
            ('show', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.ShowsShow'])),
        ))
        db.send_create_signal(u'legacy', ['MediaVideoShow'])

        # Adding model 'MediaVideoTags'
        db.create_table(u'media_video_tags', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('video', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaVideo'])),
            ('tag', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MediaTag'])),
        ))
        db.send_create_signal(u'legacy', ['MediaVideoTags'])

        # Adding model 'MembersMember'
        db.create_table(u'members_member', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('first_name', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
            ('last_name', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
            ('middle_name', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
            ('display_first', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
            ('display_last', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
            ('instrument', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('section', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('dob', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('join_date', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('bio', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('active', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['MembersMember'])

        # Adding model 'RegistrationRegistrationprofile'
        db.create_table(u'registration_registrationprofile', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.AuthUser'], unique=True)),
            ('activation_key', self.gf('django.db.models.fields.CharField')(max_length=40L)),
        ))
        db.send_create_signal(u'legacy', ['RegistrationRegistrationprofile'])

        # Adding model 'ShowsShow'
        db.create_table(u'shows_show', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('public', self.gf('django.db.models.fields.IntegerField')()),
            ('venue', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.ShowsVenue'])),
            ('date', self.gf('django.db.models.fields.DateTimeField')()),
            ('doors_time', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('ticket_price', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('ticket_url', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('ages', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('opener', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('notes', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('gross', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('commission', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('sound_cost', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('in_ears_cost', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('print_ship_cost', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('ads_cost', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('other_cost', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('net', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('payout', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
            ('to_account', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=12, decimal_places=2, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['ShowsShow'])

        # Adding model 'ShowsVenue'
        db.create_table(u'shows_venue', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('venue_name', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('venue_image', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('address1', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('address2', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('city', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('state', self.gf('django.db.models.fields.CharField')(max_length=2L, blank=True)),
            ('zip_code', self.gf('django.db.models.fields.CharField')(max_length=20L, blank=True)),
            ('country', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('phone', self.gf('django.db.models.fields.CharField')(max_length=20L, blank=True)),
            ('website', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('contact', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('notes', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['ShowsVenue'])

        # Adding model 'SongsSetlist'
        db.create_table(u'songs_setlist', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('show', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.ShowsShow'])),
        ))
        db.send_create_signal(u'legacy', ['SongsSetlist'])

        # Adding model 'SongsSetlistsong'
        db.create_table(u'songs_setlistsong', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('song', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.SongsSong'])),
            ('setlist', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.SongsSetlist'])),
            ('order', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['SongsSetlistsong'])

        # Adding model 'SongsSong'
        db.create_table(u'songs_song', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('original_artist', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('original_album', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('release_year', self.gf('django.db.models.fields.CharField')(max_length=200L, blank=True)),
            ('foh_notes', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['SongsSong'])

        # Adding model 'SongsSongSinger'
        db.create_table(u'songs_song_singer', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('song', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.SongsSong'])),
            ('member', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.MembersMember'])),
        ))
        db.send_create_signal(u'legacy', ['SongsSongSinger'])

        # Adding model 'SouthMigrationhistory'
        db.create_table(u'south_migrationhistory', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('app_name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('migration', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('applied', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['SouthMigrationhistory'])

        # Adding model 'WpBwbpsCategories'
        db.create_table(u'wp_bwbps_categories', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('image_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('category_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('tag_name', self.gf('django.db.models.fields.CharField')(max_length=250L, blank=True)),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsCategories'])

        # Adding model 'WpBwbpsCustomdata'
        db.create_table(u'wp_bwbps_customdata', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('image_id', self.gf('django.db.models.fields.IntegerField')()),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('bwbps_status', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsCustomdata'])

        # Adding model 'WpBwbpsFavorites'
        db.create_table(u'wp_bwbps_favorites', (
            ('favorite_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('image_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('user_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsFavorites'])

        # Adding model 'WpBwbpsFields'
        db.create_table(u'wp_bwbps_fields', (
            ('field_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('form_id', self.gf('django.db.models.fields.IntegerField')()),
            ('field_name', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
            ('label', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('type', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('numeric_field', self.gf('django.db.models.fields.IntegerField')()),
            ('multi_val', self.gf('django.db.models.fields.IntegerField')()),
            ('default_val', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('auto_capitalize', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('keyboard_type', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('html_filter', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('date_format', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('seq', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsFields'])

        # Adding model 'WpBwbpsForms'
        db.create_table(u'wp_bwbps_forms', (
            ('form_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('form_name', self.gf('django.db.models.fields.CharField')(max_length=30L, blank=True)),
            ('form', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('css', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('fields_used', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('category', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsForms'])

        # Adding model 'WpBwbpsGalleries'
        db.create_table(u'wp_bwbps_galleries', (
            ('gallery_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('post_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('gallery_name', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('gallery_description', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('gallery_type', self.gf('django.db.models.fields.IntegerField')()),
            ('caption', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('add_text', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('upload_form_caption', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('contrib_role', self.gf('django.db.models.fields.IntegerField')()),
            ('anchor_class', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('img_count', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('img_rel', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('img_class', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('img_perrow', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('img_perpage', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('mini_aspect', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('mini_width', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('mini_height', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('thumb_aspect', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('thumb_width', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('thumb_height', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('medium_aspect', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('medium_width', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('medium_height', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('image_aspect', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('image_width', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('image_height', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('show_caption', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('nofollow_caption', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('caption_template', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_imgcaption', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('img_status', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('allow_no_image', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('suppress_no_image', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('default_image', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('created_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('layout_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('use_customform', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('custom_formid', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('use_customfields', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('cover_imageid', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('status', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('sort_field', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('sort_order', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('poll_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('rating_position', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('hide_toggle_ratings', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('pext_insert_setid', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('max_user_uploads', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('uploads_period', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsGalleries'])

        # Adding model 'WpBwbpsImageratings'
        db.create_table(u'wp_bwbps_imageratings', (
            ('rating_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('image_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('gallery_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('poll_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('user_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('user_ip', self.gf('django.db.models.fields.CharField')(max_length=30L, blank=True)),
            ('rating', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('comment', self.gf('django.db.models.fields.CharField')(max_length=250L, blank=True)),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('status', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsImageratings'])

        # Adding model 'WpBwbpsImages'
        db.create_table(u'wp_bwbps_images', (
            ('image_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('gallery_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('user_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('post_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('comment_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('image_name', self.gf('django.db.models.fields.CharField')(max_length=250L, blank=True)),
            ('image_caption', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('file_type', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('file_name', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('file_url', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('mini_url', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('thumb_url', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('medium_url', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('image_url', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('wp_attach_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('url', self.gf('django.db.models.fields.CharField')(max_length=250L, blank=True)),
            ('custom_fields', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('meta_data', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('geolong', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('geolat', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('img_attribution', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('img_license', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('updated_by', self.gf('django.db.models.fields.BigIntegerField')()),
            ('created_date', self.gf('django.db.models.fields.DateTimeField')(null=True, blank=True)),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('status', self.gf('django.db.models.fields.IntegerField')()),
            ('alerted', self.gf('django.db.models.fields.IntegerField')()),
            ('seq', self.gf('django.db.models.fields.BigIntegerField')()),
            ('favorites_cnt', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('avg_rating', self.gf('django.db.models.fields.FloatField')()),
            ('rating_cnt', self.gf('django.db.models.fields.BigIntegerField')()),
            ('votes_sum', self.gf('django.db.models.fields.BigIntegerField')()),
            ('votes_cnt', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsImages'])

        # Adding model 'WpBwbpsLayouts'
        db.create_table(u'wp_bwbps_layouts', (
            ('layout_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('layout_name', self.gf('django.db.models.fields.CharField')(max_length=30L, blank=True)),
            ('layout_type', self.gf('django.db.models.fields.IntegerField')()),
            ('layout', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('alt_layout', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('wrapper', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('cells_perrow', self.gf('django.db.models.fields.IntegerField')()),
            ('css', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('pagination_class', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('lists', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('post_type', self.gf('django.db.models.fields.CharField')(max_length=20L, blank=True)),
            ('fields_used', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('footer_layout', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsLayouts'])

        # Adding model 'WpBwbpsLookup'
        db.create_table(u'wp_bwbps_lookup', (
            ('id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('field_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('value', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('label', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('seq', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsLookup'])

        # Adding model 'WpBwbpsParams'
        db.create_table(u'wp_bwbps_params', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('param_group', self.gf('django.db.models.fields.CharField')(max_length=20L, blank=True)),
            ('param', self.gf('django.db.models.fields.CharField')(max_length=100L, blank=True)),
            ('num_value', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('text_value', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('user_ip', self.gf('django.db.models.fields.CharField')(max_length=30L, blank=True)),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsParams'])

        # Adding model 'WpBwbpsRatingssummary'
        db.create_table(u'wp_bwbps_ratingssummary', (
            ('rating_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('image_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('gallery_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('poll_id', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('avg_rating', self.gf('django.db.models.fields.FloatField')()),
            ('rating_cnt', self.gf('django.db.models.fields.BigIntegerField')()),
            ('updated_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpBwbpsRatingssummary'])

        # Adding model 'WpCommentmeta'
        db.create_table(u'wp_commentmeta', (
            ('meta_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('comment_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('meta_key', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('meta_value', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpCommentmeta'])

        # Adding model 'WpComments'
        db.create_table(u'wp_comments', (
            ('comment_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True, db_column=u'comment_ID')),
            ('comment_post_id', self.gf('django.db.models.fields.BigIntegerField')(db_column=u'comment_post_ID')),
            ('comment_author', self.gf('django.db.models.fields.TextField')()),
            ('comment_author_email', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('comment_author_url', self.gf('django.db.models.fields.CharField')(max_length=200L)),
            ('comment_author_ip', self.gf('django.db.models.fields.CharField')(max_length=100L, db_column=u'comment_author_IP')),
            ('comment_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('comment_date_gmt', self.gf('django.db.models.fields.DateTimeField')()),
            ('comment_content', self.gf('django.db.models.fields.TextField')()),
            ('comment_karma', self.gf('django.db.models.fields.IntegerField')()),
            ('comment_approved', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('comment_agent', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('comment_type', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('comment_parent', self.gf('django.db.models.fields.BigIntegerField')()),
            ('user_id', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpComments'])

        # Adding model 'WpGigpressArtists'
        db.create_table(u'wp_gigpress_artists', (
            ('artist_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('artist_name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('artist_order', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('artist_alpha', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('artist_url', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpGigpressArtists'])

        # Adding model 'WpGigpressVenues'
        db.create_table(u'wp_gigpress_venues', (
            ('venue_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('venue_name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('venue_address', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('venue_city', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('venue_country', self.gf('django.db.models.fields.CharField')(max_length=2L)),
            ('venue_url', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('venue_phone', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('venue_state', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('venue_postal_code', self.gf('django.db.models.fields.CharField')(max_length=32L, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpGigpressVenues'])

        # Adding model 'WpGigpressShows'
        db.create_table(u'wp_gigpress_shows', (
            ('show_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('show_artist_id', self.gf('django.db.models.fields.IntegerField')()),
            ('show_venue_id', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['legacy.WpGigpressVenues'])),
            ('show_tour_id', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('show_date', self.gf('django.db.models.fields.DateField')()),
            ('show_multi', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('show_time', self.gf('django.db.models.fields.TextField')()),
            ('show_expire', self.gf('django.db.models.fields.DateField')()),
            ('show_price', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_tix_url', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_tix_phone', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_ages', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_notes', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('show_related', self.gf('django.db.models.fields.BigIntegerField')(null=True, blank=True)),
            ('show_status', self.gf('django.db.models.fields.CharField')(max_length=32L, blank=True)),
            ('show_tour_restore', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('show_address', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_locale', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_country', self.gf('django.db.models.fields.CharField')(max_length=2L, blank=True)),
            ('show_venue', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_venue_url', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_venue_phone', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('show_external_url', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpGigpressShows'])

        # Adding model 'WpGigpressTours'
        db.create_table(u'wp_gigpress_tours', (
            ('tour_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('tour_name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('tour_status', self.gf('django.db.models.fields.CharField')(max_length=32L, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpGigpressTours'])

        # Adding model 'WpLinks'
        db.create_table(u'wp_links', (
            ('link_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('link_url', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('link_name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('link_image', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('link_target', self.gf('django.db.models.fields.CharField')(max_length=25L)),
            ('link_description', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('link_visible', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('link_owner', self.gf('django.db.models.fields.BigIntegerField')()),
            ('link_rating', self.gf('django.db.models.fields.IntegerField')()),
            ('link_updated', self.gf('django.db.models.fields.DateTimeField')()),
            ('link_rel', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('link_notes', self.gf('django.db.models.fields.TextField')()),
            ('link_rss', self.gf('django.db.models.fields.CharField')(max_length=255L)),
        ))
        db.send_create_signal(u'legacy', ['WpLinks'])

        # Adding model 'WpNggAlbum'
        db.create_table(u'wp_ngg_album', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('slug', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('previewpic', self.gf('django.db.models.fields.BigIntegerField')()),
            ('albumdesc', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('sortorder', self.gf('django.db.models.fields.TextField')()),
            ('pageid', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpNggAlbum'])

        # Adding model 'WpNggGallery'
        db.create_table(u'wp_ngg_gallery', (
            ('gid', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('slug', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('path', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('title', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('galdesc', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('pageid', self.gf('django.db.models.fields.BigIntegerField')()),
            ('previewpic', self.gf('django.db.models.fields.BigIntegerField')()),
            ('author', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpNggGallery'])

        # Adding model 'WpNggPictures'
        db.create_table(u'wp_ngg_pictures', (
            ('pid', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('image_slug', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('post_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('galleryid', self.gf('django.db.models.fields.BigIntegerField')()),
            ('filename', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('description', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('alttext', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('imagedate', self.gf('django.db.models.fields.DateTimeField')()),
            ('exclude', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('sortorder', self.gf('django.db.models.fields.BigIntegerField')()),
            ('meta_data', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpNggPictures'])

        # Adding model 'WpNggcfFieldValues'
        db.create_table(u'wp_nggcf_field_values', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('sid', self.gf('django.db.models.fields.BigIntegerField')(unique=True)),
            ('pid', self.gf('django.db.models.fields.BigIntegerField')()),
            ('fid', self.gf('django.db.models.fields.BigIntegerField')()),
            ('field_value', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('ngg_type', self.gf('django.db.models.fields.IntegerField')()),
            ('dateadded', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpNggcfFieldValues'])

        # Adding model 'WpNggcfFields'
        db.create_table(u'wp_nggcf_fields', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('sid', self.gf('django.db.models.fields.BigIntegerField')(unique=True)),
            ('field_name', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('field_type', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('ngg_type', self.gf('django.db.models.fields.IntegerField')()),
            ('drop_options', self.gf('django.db.models.fields.TextField')(blank=True)),
            ('dateadded', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpNggcfFields'])

        # Adding model 'WpNggcfFieldsLink'
        db.create_table(u'wp_nggcf_fields_link', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('sid', self.gf('django.db.models.fields.BigIntegerField')(unique=True)),
            ('field_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('gid', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpNggcfFieldsLink'])

        # Adding model 'WpOptions'
        db.create_table(u'wp_options', (
            ('option_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('option_name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=64L)),
            ('option_value', self.gf('django.db.models.fields.TextField')()),
            ('autoload', self.gf('django.db.models.fields.CharField')(max_length=20L)),
        ))
        db.send_create_signal(u'legacy', ['WpOptions'])

        # Adding model 'WpPostmeta'
        db.create_table(u'wp_postmeta', (
            ('meta_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('post_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('meta_key', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('meta_value', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpPostmeta'])

        # Adding model 'WpPosts'
        db.create_table(u'wp_posts', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True, db_column=u'ID')),
            ('post_author', self.gf('django.db.models.fields.BigIntegerField')()),
            ('post_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('post_date_gmt', self.gf('django.db.models.fields.DateTimeField')()),
            ('post_content', self.gf('django.db.models.fields.TextField')()),
            ('post_title', self.gf('django.db.models.fields.TextField')()),
            ('post_excerpt', self.gf('django.db.models.fields.TextField')()),
            ('post_status', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('comment_status', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('ping_status', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('post_password', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('post_name', self.gf('django.db.models.fields.CharField')(max_length=200L)),
            ('to_ping', self.gf('django.db.models.fields.TextField')()),
            ('pinged', self.gf('django.db.models.fields.TextField')()),
            ('post_modified', self.gf('django.db.models.fields.DateTimeField')()),
            ('post_modified_gmt', self.gf('django.db.models.fields.DateTimeField')()),
            ('post_content_filtered', self.gf('django.db.models.fields.TextField')()),
            ('post_parent', self.gf('django.db.models.fields.BigIntegerField')()),
            ('guid', self.gf('django.db.models.fields.CharField')(max_length=255L)),
            ('menu_order', self.gf('django.db.models.fields.IntegerField')()),
            ('post_type', self.gf('django.db.models.fields.CharField')(max_length=20L)),
            ('post_mime_type', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('comment_count', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpPosts'])

        # Adding model 'WpRandomtext'
        db.create_table(u'wp_randomtext', (
            ('randomtext_id', self.gf('django.db.models.fields.IntegerField')(primary_key=True)),
            ('category', self.gf('django.db.models.fields.CharField')(max_length=32L)),
            ('text', self.gf('django.db.models.fields.TextField')()),
            ('visible', self.gf('django.db.models.fields.CharField')(max_length=3L)),
            ('user_id', self.gf('django.db.models.fields.IntegerField')()),
            ('timestamp', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal(u'legacy', ['WpRandomtext'])

        # Adding model 'WpTermRelationships'
        db.create_table(u'wp_term_relationships', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('object_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('term_taxonomy_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('term_order', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpTermRelationships'])

        # Adding model 'WpTermTaxonomy'
        db.create_table(u'wp_term_taxonomy', (
            ('term_taxonomy_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('term_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('taxonomy', self.gf('django.db.models.fields.CharField')(max_length=32L)),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('parent', self.gf('django.db.models.fields.BigIntegerField')()),
            ('count', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpTermTaxonomy'])

        # Adding model 'WpTerms'
        db.create_table(u'wp_terms', (
            ('term_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200L)),
            ('slug', self.gf('django.db.models.fields.CharField')(unique=True, max_length=200L)),
            ('term_group', self.gf('django.db.models.fields.BigIntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpTerms'])

        # Adding model 'WpUsermeta'
        db.create_table(u'wp_usermeta', (
            ('umeta_id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True)),
            ('user_id', self.gf('django.db.models.fields.BigIntegerField')()),
            ('meta_key', self.gf('django.db.models.fields.CharField')(max_length=255L, blank=True)),
            ('meta_value', self.gf('django.db.models.fields.TextField')(blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpUsermeta'])

        # Adding model 'WpUsers'
        db.create_table(u'wp_users', (
            ('id', self.gf('django.db.models.fields.BigIntegerField')(primary_key=True, db_column=u'ID')),
            ('user_login', self.gf('django.db.models.fields.CharField')(max_length=60L)),
            ('user_pass', self.gf('django.db.models.fields.CharField')(max_length=64L)),
            ('user_nicename', self.gf('django.db.models.fields.CharField')(max_length=50L)),
            ('user_email', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('user_url', self.gf('django.db.models.fields.CharField')(max_length=100L)),
            ('user_registered', self.gf('django.db.models.fields.DateTimeField')()),
            ('user_activation_key', self.gf('django.db.models.fields.CharField')(max_length=60L)),
            ('user_status', self.gf('django.db.models.fields.IntegerField')()),
            ('display_name', self.gf('django.db.models.fields.CharField')(max_length=250L)),
        ))
        db.send_create_signal(u'legacy', ['WpUsers'])

        # Adding model 'WpWpb2DExcludedFiles'
        db.create_table(u'wp_wpb2d_excluded_files', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('file', self.gf('django.db.models.fields.CharField')(unique=True, max_length=255L)),
            ('isdir', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'legacy', ['WpWpb2DExcludedFiles'])

        # Adding model 'WpWpb2DOptions'
        db.create_table(u'wp_wpb2d_options', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50L)),
            ('value', self.gf('django.db.models.fields.CharField')(max_length=255L)),
        ))
        db.send_create_signal(u'legacy', ['WpWpb2DOptions'])

        # Adding model 'WpWpb2DPremiumExtensions'
        db.create_table(u'wp_wpb2d_premium_extensions', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=50L)),
            ('file', self.gf('django.db.models.fields.CharField')(max_length=255L)),
        ))
        db.send_create_signal(u'legacy', ['WpWpb2DPremiumExtensions'])

        # Adding model 'WpWpb2DProcessedFiles'
        db.create_table(u'wp_wpb2d_processed_files', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('file', self.gf('django.db.models.fields.CharField')(unique=True, max_length=255L)),
            ('offset', self.gf('django.db.models.fields.IntegerField')()),
            ('uploadid', self.gf('django.db.models.fields.CharField')(max_length=50L, blank=True)),
        ))
        db.send_create_signal(u'legacy', ['WpWpb2DProcessedFiles'])


    def backwards(self, orm):
        # Deleting model 'AccountsUserprofile'
        db.delete_table(u'accounts_userprofile')

        # Deleting model 'AhmFiles'
        db.delete_table(u'ahm_files')

        # Deleting model 'AuthGroup'
        db.delete_table(u'auth_group')

        # Deleting model 'AuthGroupPermissions'
        db.delete_table(u'auth_group_permissions')

        # Deleting model 'AuthPermission'
        db.delete_table(u'auth_permission')

        # Deleting model 'AuthUser'
        db.delete_table(u'auth_user')

        # Deleting model 'AuthUserGroups'
        db.delete_table(u'auth_user_groups')

        # Deleting model 'AuthUserUserPermissions'
        db.delete_table(u'auth_user_user_permissions')

        # Deleting model 'DjangoAdminLog'
        db.delete_table(u'django_admin_log')

        # Deleting model 'DjangoContentType'
        db.delete_table(u'django_content_type')

        # Deleting model 'DjangoSession'
        db.delete_table(u'django_session')

        # Deleting model 'DjangoSite'
        db.delete_table(u'django_site')

        # Deleting model 'MarketingTestimonial'
        db.delete_table(u'marketing_testimonial')

        # Deleting model 'MediaAlbum'
        db.delete_table(u'media_album')

        # Deleting model 'MediaAlbumShow'
        db.delete_table(u'media_album_show')

        # Deleting model 'MediaImage'
        db.delete_table(u'media_image')

        # Deleting model 'MediaImageAlbums'
        db.delete_table(u'media_image_albums')

        # Deleting model 'MediaImageShow'
        db.delete_table(u'media_image_show')

        # Deleting model 'MediaImageTags'
        db.delete_table(u'media_image_tags')

        # Deleting model 'MediaTag'
        db.delete_table(u'media_tag')

        # Deleting model 'MediaVideo'
        db.delete_table(u'media_video')

        # Deleting model 'MediaVideoAlbums'
        db.delete_table(u'media_video_albums')

        # Deleting model 'MediaVideoShow'
        db.delete_table(u'media_video_show')

        # Deleting model 'MediaVideoTags'
        db.delete_table(u'media_video_tags')

        # Deleting model 'MembersMember'
        db.delete_table(u'members_member')

        # Deleting model 'RegistrationRegistrationprofile'
        db.delete_table(u'registration_registrationprofile')

        # Deleting model 'ShowsShow'
        db.delete_table(u'shows_show')

        # Deleting model 'ShowsVenue'
        db.delete_table(u'shows_venue')

        # Deleting model 'SongsSetlist'
        db.delete_table(u'songs_setlist')

        # Deleting model 'SongsSetlistsong'
        db.delete_table(u'songs_setlistsong')

        # Deleting model 'SongsSong'
        db.delete_table(u'songs_song')

        # Deleting model 'SongsSongSinger'
        db.delete_table(u'songs_song_singer')

        # Deleting model 'SouthMigrationhistory'
        db.delete_table(u'south_migrationhistory')

        # Deleting model 'WpBwbpsCategories'
        db.delete_table(u'wp_bwbps_categories')

        # Deleting model 'WpBwbpsCustomdata'
        db.delete_table(u'wp_bwbps_customdata')

        # Deleting model 'WpBwbpsFavorites'
        db.delete_table(u'wp_bwbps_favorites')

        # Deleting model 'WpBwbpsFields'
        db.delete_table(u'wp_bwbps_fields')

        # Deleting model 'WpBwbpsForms'
        db.delete_table(u'wp_bwbps_forms')

        # Deleting model 'WpBwbpsGalleries'
        db.delete_table(u'wp_bwbps_galleries')

        # Deleting model 'WpBwbpsImageratings'
        db.delete_table(u'wp_bwbps_imageratings')

        # Deleting model 'WpBwbpsImages'
        db.delete_table(u'wp_bwbps_images')

        # Deleting model 'WpBwbpsLayouts'
        db.delete_table(u'wp_bwbps_layouts')

        # Deleting model 'WpBwbpsLookup'
        db.delete_table(u'wp_bwbps_lookup')

        # Deleting model 'WpBwbpsParams'
        db.delete_table(u'wp_bwbps_params')

        # Deleting model 'WpBwbpsRatingssummary'
        db.delete_table(u'wp_bwbps_ratingssummary')

        # Deleting model 'WpCommentmeta'
        db.delete_table(u'wp_commentmeta')

        # Deleting model 'WpComments'
        db.delete_table(u'wp_comments')

        # Deleting model 'WpGigpressArtists'
        db.delete_table(u'wp_gigpress_artists')

        # Deleting model 'WpGigpressVenues'
        db.delete_table(u'wp_gigpress_venues')

        # Deleting model 'WpGigpressShows'
        db.delete_table(u'wp_gigpress_shows')

        # Deleting model 'WpGigpressTours'
        db.delete_table(u'wp_gigpress_tours')

        # Deleting model 'WpLinks'
        db.delete_table(u'wp_links')

        # Deleting model 'WpNggAlbum'
        db.delete_table(u'wp_ngg_album')

        # Deleting model 'WpNggGallery'
        db.delete_table(u'wp_ngg_gallery')

        # Deleting model 'WpNggPictures'
        db.delete_table(u'wp_ngg_pictures')

        # Deleting model 'WpNggcfFieldValues'
        db.delete_table(u'wp_nggcf_field_values')

        # Deleting model 'WpNggcfFields'
        db.delete_table(u'wp_nggcf_fields')

        # Deleting model 'WpNggcfFieldsLink'
        db.delete_table(u'wp_nggcf_fields_link')

        # Deleting model 'WpOptions'
        db.delete_table(u'wp_options')

        # Deleting model 'WpPostmeta'
        db.delete_table(u'wp_postmeta')

        # Deleting model 'WpPosts'
        db.delete_table(u'wp_posts')

        # Deleting model 'WpRandomtext'
        db.delete_table(u'wp_randomtext')

        # Deleting model 'WpTermRelationships'
        db.delete_table(u'wp_term_relationships')

        # Deleting model 'WpTermTaxonomy'
        db.delete_table(u'wp_term_taxonomy')

        # Deleting model 'WpTerms'
        db.delete_table(u'wp_terms')

        # Deleting model 'WpUsermeta'
        db.delete_table(u'wp_usermeta')

        # Deleting model 'WpUsers'
        db.delete_table(u'wp_users')

        # Deleting model 'WpWpb2DExcludedFiles'
        db.delete_table(u'wp_wpb2d_excluded_files')

        # Deleting model 'WpWpb2DOptions'
        db.delete_table(u'wp_wpb2d_options')

        # Deleting model 'WpWpb2DPremiumExtensions'
        db.delete_table(u'wp_wpb2d_premium_extensions')

        # Deleting model 'WpWpb2DProcessedFiles'
        db.delete_table(u'wp_wpb2d_processed_files')


    models = {
        u'legacy.accountsuserprofile': {
            'Meta': {'object_name': 'AccountsUserprofile', 'db_table': "u'accounts_userprofile'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'newsletter_subscribe': ('django.db.models.fields.IntegerField', [], {}),
            'picture': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthUser']", 'unique': 'True'})
        },
        u'legacy.ahmfiles': {
            'Meta': {'object_name': 'AhmFiles', 'db_table': "u'ahm_files'"},
            'access': ('django.db.models.fields.CharField', [], {'max_length': '6L'}),
            'description': ('django.db.models.fields.TextField', [], {}),
            'download_count': ('django.db.models.fields.IntegerField', [], {}),
            'file': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'link_label': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '40L'}),
            'show_counter': ('django.db.models.fields.IntegerField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255L'})
        },
        u'legacy.authgroup': {
            'Meta': {'object_name': 'AuthGroup', 'db_table': "u'auth_group'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80L'})
        },
        u'legacy.authgrouppermissions': {
            'Meta': {'object_name': 'AuthGroupPermissions', 'db_table': "u'auth_group_permissions'"},
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthGroup']"}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'permission': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthPermission']"})
        },
        u'legacy.authpermission': {
            'Meta': {'object_name': 'AuthPermission', 'db_table': "u'auth_permission'"},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.DjangoContentType']"}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50L'})
        },
        u'legacy.authuser': {
            'Meta': {'object_name': 'AuthUser', 'db_table': "u'auth_user'"},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {}),
            'email': ('django.db.models.fields.CharField', [], {'max_length': '75L'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30L'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.IntegerField', [], {}),
            'is_staff': ('django.db.models.fields.IntegerField', [], {}),
            'is_superuser': ('django.db.models.fields.IntegerField', [], {}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30L'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128L'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30L'})
        },
        u'legacy.authusergroups': {
            'Meta': {'object_name': 'AuthUserGroups', 'db_table': "u'auth_user_groups'"},
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthGroup']"}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthUser']"})
        },
        u'legacy.authuseruserpermissions': {
            'Meta': {'object_name': 'AuthUserUserPermissions', 'db_table': "u'auth_user_user_permissions'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'permission': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthPermission']"}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthUser']"})
        },
        u'legacy.djangoadminlog': {
            'Meta': {'object_name': 'DjangoAdminLog', 'db_table': "u'django_admin_log'"},
            'action_flag': ('django.db.models.fields.IntegerField', [], {}),
            'action_time': ('django.db.models.fields.DateTimeField', [], {}),
            'change_message': ('django.db.models.fields.TextField', [], {}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.DjangoContentType']", 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'object_id': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'object_repr': ('django.db.models.fields.CharField', [], {'max_length': '200L'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthUser']"})
        },
        u'legacy.djangocontenttype': {
            'Meta': {'object_name': 'DjangoContentType', 'db_table': "u'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100L'})
        },
        u'legacy.djangosession': {
            'Meta': {'object_name': 'DjangoSession', 'db_table': "u'django_session'"},
            'expire_date': ('django.db.models.fields.DateTimeField', [], {}),
            'session_data': ('django.db.models.fields.TextField', [], {}),
            'session_key': ('django.db.models.fields.CharField', [], {'max_length': '40L', 'primary_key': 'True'})
        },
        u'legacy.djangosite': {
            'Meta': {'object_name': 'DjangoSite', 'db_table': "u'django_site'"},
            'domain': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50L'})
        },
        u'legacy.marketingtestimonial': {
            'Meta': {'object_name': 'MarketingTestimonial', 'db_table': "u'marketing_testimonial'"},
            'featured': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'quote': ('django.db.models.fields.TextField', [], {}),
            'show': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.ShowsShow']", 'null': 'True', 'blank': 'True'}),
            'source': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'})
        },
        u'legacy.mediaalbum': {
            'Meta': {'object_name': 'MediaAlbum', 'db_table': "u'media_album'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'public': ('django.db.models.fields.IntegerField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '100L'})
        },
        u'legacy.mediaalbumshow': {
            'Meta': {'object_name': 'MediaAlbumShow', 'db_table': "u'media_album_show'"},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaAlbum']"}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'show': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.ShowsShow']"})
        },
        u'legacy.mediaimage': {
            'Meta': {'object_name': 'MediaImage', 'db_table': "u'media_image'"},
            'created': ('django.db.models.fields.DateTimeField', [], {}),
            'height': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'thumbnail': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'thumbnail2': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '60L', 'blank': 'True'}),
            'width': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        u'legacy.mediaimagealbums': {
            'Meta': {'object_name': 'MediaImageAlbums', 'db_table': "u'media_image_albums'"},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaAlbum']"}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaImage']"})
        },
        u'legacy.mediaimageshow': {
            'Meta': {'object_name': 'MediaImageShow', 'db_table': "u'media_image_show'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaImage']"}),
            'show': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.ShowsShow']"})
        },
        u'legacy.mediaimagetags': {
            'Meta': {'object_name': 'MediaImageTags', 'db_table': "u'media_image_tags'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaImage']"}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaTag']"})
        },
        u'legacy.mediatag': {
            'Meta': {'object_name': 'MediaTag', 'db_table': "u'media_tag'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'tag': ('django.db.models.fields.CharField', [], {'max_length': '50L'})
        },
        u'legacy.mediavideo': {
            'Meta': {'object_name': 'MediaVideo', 'db_table': "u'media_video'"},
            'created': ('django.db.models.fields.DateTimeField', [], {}),
            'embed_type': ('django.db.models.fields.CharField', [], {'max_length': '10L', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '60L', 'blank': 'True'}),
            'url': ('django.db.models.fields.CharField', [], {'max_length': '200L'})
        },
        u'legacy.mediavideoalbums': {
            'Meta': {'object_name': 'MediaVideoAlbums', 'db_table': "u'media_video_albums'"},
            'album': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaAlbum']"}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'video': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaVideo']"})
        },
        u'legacy.mediavideoshow': {
            'Meta': {'object_name': 'MediaVideoShow', 'db_table': "u'media_video_show'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'show': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.ShowsShow']"}),
            'video': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaVideo']"})
        },
        u'legacy.mediavideotags': {
            'Meta': {'object_name': 'MediaVideoTags', 'db_table': "u'media_video_tags'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaTag']"}),
            'video': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MediaVideo']"})
        },
        u'legacy.membersmember': {
            'Meta': {'object_name': 'MembersMember', 'db_table': "u'members_member'"},
            'active': ('django.db.models.fields.IntegerField', [], {}),
            'bio': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'display_first': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'}),
            'display_last': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'}),
            'dob': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'instrument': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'join_date': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'}),
            'middle_name': ('django.db.models.fields.CharField', [], {'max_length': '50L', 'blank': 'True'}),
            'section': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'})
        },
        u'legacy.registrationregistrationprofile': {
            'Meta': {'object_name': 'RegistrationRegistrationprofile', 'db_table': "u'registration_registrationprofile'"},
            'activation_key': ('django.db.models.fields.CharField', [], {'max_length': '40L'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.AuthUser']", 'unique': 'True'})
        },
        u'legacy.showsshow': {
            'Meta': {'object_name': 'ShowsShow', 'db_table': "u'shows_show'"},
            'ads_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'ages': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'commission': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateTimeField', [], {}),
            'doors_time': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'gross': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'in_ears_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'net': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'notes': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'opener': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'other_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'payout': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'print_ship_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'public': ('django.db.models.fields.IntegerField', [], {}),
            'sound_cost': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'ticket_price': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'ticket_url': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'to_account': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '12', 'decimal_places': '2', 'blank': 'True'}),
            'venue': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.ShowsVenue']"})
        },
        u'legacy.showsvenue': {
            'Meta': {'object_name': 'ShowsVenue', 'db_table': "u'shows_venue'"},
            'address1': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'address2': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'city': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'contact': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'country': ('django.db.models.fields.CharField', [], {'max_length': '100L', 'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'notes': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '20L', 'blank': 'True'}),
            'state': ('django.db.models.fields.CharField', [], {'max_length': '2L', 'blank': 'True'}),
            'venue_image': ('django.db.models.fields.CharField', [], {'max_length': '100L'}),
            'venue_name': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'website': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'zip_code': ('django.db.models.fields.CharField', [], {'max_length': '20L', 'blank': 'True'})
        },
        u'legacy.songssetlist': {
            'Meta': {'object_name': 'SongsSetlist', 'db_table': "u'songs_setlist'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'show': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.ShowsShow']"})
        },
        u'legacy.songssetlistsong': {
            'Meta': {'object_name': 'SongsSetlistsong', 'db_table': "u'songs_setlistsong'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'order': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'setlist': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.SongsSetlist']"}),
            'song': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.SongsSong']"})
        },
        u'legacy.songssong': {
            'Meta': {'object_name': 'SongsSong', 'db_table': "u'songs_song'"},
            'foh_notes': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'original_album': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'original_artist': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'}),
            'release_year': ('django.db.models.fields.CharField', [], {'max_length': '200L', 'blank': 'True'})
        },
        u'legacy.songssongsinger': {
            'Meta': {'object_name': 'SongsSongSinger', 'db_table': "u'songs_song_singer'"},
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'member': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.MembersMember']"}),
            'song': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['legacy.SongsSong']"})
        },
        u'legacy.southmigrationhistory': {
            'Meta': {'object_name': 'SouthMigrationhistory', 'db_table': "u'south_migrationhistory'"},
            'app_name': ('django.db.models.fields.CharField', [], {'max_length': '255L'}),
            'applied': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.IntegerField', [], {'primary_key': 'True'}),
            'migration': ('django.db.models.fields.CharField', [], {'max_length': '255L'})
        },
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