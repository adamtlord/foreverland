# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import sorl.thumbnail.fields
import localflavor.us.models


class Migration(migrations.Migration):

    dependencies = [
        ('fidouche', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Show',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('public', models.BooleanField(default=True)),
                ('date', models.DateTimeField()),
                ('doors_time', models.TimeField(null=True, blank=True)),
                ('ticket_price', models.CharField(max_length=100, null=True, blank=True)),
                ('ticket_url', models.URLField(null=True, blank=True)),
                ('ages', models.CharField(max_length=100, null=True, blank=True)),
                ('opener', models.CharField(max_length=200, null=True, blank=True)),
                ('notes', models.TextField(null=True, blank=True)),
                ('poster', models.FileField(null=True, upload_to=b'posters/', blank=True)),
                ('fb_event', models.CharField(max_length=200, null=True, blank=True)),
                ('attendance', models.IntegerField(null=True, blank=True)),
                ('gross', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('gross_itemized', models.BooleanField(default=False)),
                ('fee', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('food_buyout', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('travel_buyout', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('lodging_buyout', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('other_buyout', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('gross_method', models.CharField(default=b'cash', max_length=100, null=True, blank=True, choices=[(b'cash', b'Cash'), (b'check', b'Check')])),
                ('payer', models.CharField(default=b'client', max_length=100, null=True, blank=True, choices=[(b'client', b'Client'), (b'agent', b'Agent')])),
                ('payee_check_no', models.IntegerField(null=True, blank=True)),
                ('commission', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('commission_withheld', models.BooleanField(default=True)),
                ('commission_percentage', models.IntegerField(default=10, null=True, blank=True)),
                ('commission_check_no', models.IntegerField(null=True, blank=True)),
                ('commission_paid', models.BooleanField(default=False)),
                ('sound_cost', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('sound_check_no', models.IntegerField(null=True, blank=True)),
                ('in_ears_cost', models.IntegerField(default=130, null=True, blank=True, choices=[(80, b'$80'), (130, b'$130')])),
                ('in_ears_check_no', models.IntegerField(null=True, blank=True)),
                ('costs_itemized', models.BooleanField(default=False)),
                ('print_ship_cost', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('ads_cost', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('other_cost', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('net', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('payout', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('to_account', models.DecimalField(null=True, max_digits=10, decimal_places=2, blank=True)),
                ('subs', models.BooleanField(default=False)),
                ('settlement_sheet', sorl.thumbnail.fields.ImageField(null=True, upload_to=b'receipts/', blank=True)),
                ('payout_notes', models.TextField(null=True, blank=True)),
                ('agent', models.ForeignKey(related_name=b'gig_agent', blank=True, to='fidouche.Agent', null=True)),
            ],
            options={
                'ordering': ['date'],
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Tour',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Venue',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('venue_name', models.CharField(max_length=200, null=True, blank=True)),
                ('venue_image', models.ImageField(upload_to=b'venues/', blank=True)),
                ('address1', models.CharField(max_length=100, null=True, blank=True)),
                ('address2', models.CharField(max_length=100, null=True, blank=True)),
                ('city', models.CharField(max_length=100, null=True, blank=True)),
                ('state', localflavor.us.models.USStateField(blank=True, max_length=2, null=True, choices=[(b'AL', b'Alabama'), (b'AK', b'Alaska'), (b'AS', b'American Samoa'), (b'AZ', b'Arizona'), (b'AR', b'Arkansas'), (b'AA', b'Armed Forces Americas'), (b'AE', b'Armed Forces Europe'), (b'AP', b'Armed Forces Pacific'), (b'CA', b'California'), (b'CO', b'Colorado'), (b'CT', b'Connecticut'), (b'DE', b'Delaware'), (b'DC', b'District of Columbia'), (b'FL', b'Florida'), (b'GA', b'Georgia'), (b'GU', b'Guam'), (b'HI', b'Hawaii'), (b'ID', b'Idaho'), (b'IL', b'Illinois'), (b'IN', b'Indiana'), (b'IA', b'Iowa'), (b'KS', b'Kansas'), (b'KY', b'Kentucky'), (b'LA', b'Louisiana'), (b'ME', b'Maine'), (b'MD', b'Maryland'), (b'MA', b'Massachusetts'), (b'MI', b'Michigan'), (b'MN', b'Minnesota'), (b'MS', b'Mississippi'), (b'MO', b'Missouri'), (b'MT', b'Montana'), (b'NE', b'Nebraska'), (b'NV', b'Nevada'), (b'NH', b'New Hampshire'), (b'NJ', b'New Jersey'), (b'NM', b'New Mexico'), (b'NY', b'New York'), (b'NC', b'North Carolina'), (b'ND', b'North Dakota'), (b'MP', b'Northern Mariana Islands'), (b'OH', b'Ohio'), (b'OK', b'Oklahoma'), (b'OR', b'Oregon'), (b'PA', b'Pennsylvania'), (b'PR', b'Puerto Rico'), (b'RI', b'Rhode Island'), (b'SC', b'South Carolina'), (b'SD', b'South Dakota'), (b'TN', b'Tennessee'), (b'TX', b'Texas'), (b'UT', b'Utah'), (b'VT', b'Vermont'), (b'VI', b'Virgin Islands'), (b'VA', b'Virginia'), (b'WA', b'Washington'), (b'WV', b'West Virginia'), (b'WI', b'Wisconsin'), (b'WY', b'Wyoming')])),
                ('zip_code', models.CharField(max_length=20, null=True, blank=True)),
                ('country', models.CharField(default=b'U.S.A.', max_length=100, null=True, blank=True)),
                ('phone', localflavor.us.models.PhoneNumberField(max_length=20, null=True, blank=True)),
                ('website', models.URLField(null=True, blank=True)),
                ('contact', models.CharField(max_length=100, null=True, blank=True)),
                ('notes', models.TextField(null=True, blank=True)),
                ('ltlng', models.CharField(max_length=100, null=True, blank=True)),
                ('capacity', models.IntegerField(null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='show',
            name='tour',
            field=models.ForeignKey(related_name=b'show_in_tour', blank=True, to='shows.Tour', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='show',
            name='venue',
            field=models.ForeignKey(related_name=b'venue', to='shows.Venue'),
            preserve_default=True,
        ),
    ]
