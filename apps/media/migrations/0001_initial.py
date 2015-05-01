# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import sorl.thumbnail.fields


class Migration(migrations.Migration):

    dependencies = [
        ('shows', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Album',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=100)),
                ('public', models.BooleanField(default=False)),
                ('show', models.ManyToManyField(to='shows.Show', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Download',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=60, null=True, blank=True)),
                ('downloadable', models.FileField(upload_to=b'dl/')),
                ('updated', models.DateTimeField(auto_now=True, auto_now_add=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=60, null=True, blank=True)),
                ('image', sorl.thumbnail.fields.ImageField(upload_to=b'images/')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('width', models.IntegerField(null=True, blank=True)),
                ('height', models.IntegerField(null=True, blank=True)),
                ('albums', models.ManyToManyField(to='media.Album', blank=True)),
                ('show', models.ManyToManyField(to='shows.Show', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tag', models.CharField(max_length=50)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Video',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=60, null=True, blank=True)),
                ('url', models.URLField()),
                ('vid_id', models.CharField(max_length=100, null=True, blank=True)),
                ('embed_type', models.CharField(default=b'yt', max_length=10, null=True, blank=True, choices=[(b'yt', b'YouTube'), (b'fb', b'Facebook'), (b'vm', b'Vimeo'), (b'o', b'other')])),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('featured', models.BooleanField(default=False)),
                ('albums', models.ManyToManyField(to='media.Album', blank=True)),
                ('show', models.ManyToManyField(to='shows.Show', blank=True)),
                ('tags', models.ManyToManyField(to='media.Tag', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='image',
            name='tags',
            field=models.ManyToManyField(to='media.Tag', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='download',
            name='tags',
            field=models.ManyToManyField(to='media.Tag', blank=True),
            preserve_default=True,
        ),
    ]
