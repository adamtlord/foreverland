import datetime
from django.db import models
from sorl.thumbnail import ImageField
from members.models import Member, Sub
from shows.models import Show


class Payment(models.Model):
	show = models.ForeignKey(Show, related_name="payment", blank=True, null=True)
	member = models.ForeignKey(Member, related_name="payment", blank=True, null=True)
	amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
	paid = models.BooleanField(default=False)

	class Meta:
		unique_together = (('show','member'),)

	def __unicode__(self):
		return '%s for %s on %s' % (self.member.display_first, self.show.venue, self.show.date.strftime('%m/%d/%y'))


class SubPayment(models.Model):
	show = models.ForeignKey(Show, related_name="subpayment", blank=True, null=True)
	sub = models.ForeignKey(Sub, related_name="sub", blank=True, null=True)
	amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
	paid = models.BooleanField(default=False)

	class Meta:
		unique_together = (('show','sub'),)

	def  __unicode__(self):
		return '%s for %s on %s' % (self.sub.first_name, self.show.venue, self.show.date.strftime('%m/%d/%y'))


class Payee(models.Model):
	name = models.CharField(max_length=200, blank=True, null=True)

	def __unicode__(self):
		return self.name


class Expense(models.Model):
    EXPENSE_CATEGORIES = (
        ('print','printing'),
        ('ship','shipping'),
        ('ads','ads'),
        ('rent','rent'),
        ('equipment','equipment'),
        ('subcon','subcontracted services'),
        ('other','other'),
    )
    show = models.ForeignKey(Show, related_name="expense", blank=True, null=True)
    date = models.DateField(default=datetime.date.today)
    payee = models.ForeignKey(Payee, related_name="expense", blank=True, null=True)
    category = models.CharField(max_length=100, blank=True, null=True, choices=EXPENSE_CATEGORIES)
    amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    check_no = models.CharField(max_length=100, blank=True, null=True, verbose_name="Check #")
    notes = models.TextField(blank=True, null=True)
    receipt_img = ImageField(upload_to="receipts/", blank=True, null=True)

    def __unicode__(self):
        return '%s, $%s to %s' % (self.date.strftime('%m/%d/%y'), self.amount, self.payee)