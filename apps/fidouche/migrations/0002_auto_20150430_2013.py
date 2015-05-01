# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('members', '0001_initial'),
        ('shows', '0001_initial'),
        ('fidouche', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='tourexpense',
            name='tour',
            field=models.ForeignKey(blank=True, to='shows.Tour', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='subpayment',
            name='show',
            field=models.ForeignKey(related_name=b'subpayment', blank=True, to='shows.Show', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='subpayment',
            name='sub',
            field=models.ForeignKey(related_name=b'sub', blank=True, to='members.Sub', null=True),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='subpayment',
            unique_together=set([('show', 'sub')]),
        ),
        migrations.AddField(
            model_name='productionpayment',
            name='category',
            field=models.ForeignKey(blank=True, to='fidouche.ProductionCategory', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='productionpayment',
            name='company',
            field=models.ForeignKey(related_name=b'production_payment', to='fidouche.ProductionCompany'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='productionpayment',
            name='show',
            field=models.ForeignKey(related_name=b'production_payment', blank=True, to='shows.Show', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='productioncategory',
            name='tax_category',
            field=models.ForeignKey(related_name=b'production_category', blank=True, to='fidouche.TaxExpenseCategory', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='payment',
            name='member',
            field=models.ForeignKey(related_name=b'payment', blank=True, to='members.Member', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='payment',
            name='show',
            field=models.ForeignKey(related_name=b'payment', blank=True, to='shows.Show', null=True),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='payment',
            unique_together=set([('show', 'member')]),
        ),
        migrations.AddField(
            model_name='expensecategory',
            name='tax_category',
            field=models.ForeignKey(related_name=b'expense_category', blank=True, to='fidouche.TaxExpenseCategory', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='expense',
            name='new_category',
            field=models.ForeignKey(related_name=b'expense_category', verbose_name=b'Category', blank=True, to='fidouche.ExpenseCategory', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='expense',
            name='payee',
            field=models.ForeignKey(related_name=b'expense', blank=True, to='fidouche.Payee', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='expense',
            name='show',
            field=models.ForeignKey(related_name=b'expense', blank=True, to='shows.Show', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='commissionpayment',
            name='agent',
            field=models.ForeignKey(related_name=b'commission_payment', blank=True, to='fidouche.Agent', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='commissionpayment',
            name='show',
            field=models.ForeignKey(related_name=b'commission_payment', blank=True, to='shows.Show', null=True),
            preserve_default=True,
        ),
        migrations.AlterUniqueTogether(
            name='commissionpayment',
            unique_together=set([('show', 'agent')]),
        ),
    ]
