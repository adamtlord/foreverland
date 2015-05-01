# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('members', '0001_initial'),
        ('shows', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Setlist',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('show', models.ForeignKey(related_name=b'setlist', to='shows.Show')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SetlistSong',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('order', models.IntegerField(null=True, blank=True)),
                ('setlist', models.ForeignKey(to='songs.Setlist')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Song',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, blank=True)),
                ('original_artist', models.CharField(max_length=200, null=True, blank=True)),
                ('original_album', models.CharField(max_length=200, null=True, blank=True)),
                ('release_year', models.CharField(max_length=200, null=True, blank=True)),
                ('display', models.BooleanField(default=True)),
                ('foh_notes', models.TextField(null=True, verbose_name=b'Notes for FOH', blank=True)),
                ('singer', models.ManyToManyField(related_name=b'singer', null=True, to='members.Member', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='setlistsong',
            name='song',
            field=models.ForeignKey(to='songs.Song'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='setlist',
            name='songs',
            field=models.ManyToManyField(to='songs.Song', through='songs.SetlistSong'),
            preserve_default=True,
        ),
    ]
