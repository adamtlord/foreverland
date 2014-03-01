from django.db import models

from members.models import Member
from shows.models import Show


class Payment(models.Model):
	show = models.ForeignKey(Show, related_name="payment", blank=True, null=True)
	member = models.ForeignKey(Member, related_name="payment", blank=True, null=True)
	amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
	paid = models.BooleanField(default=False)

	class Meta:
		unique_together = (("show","member"),)


	def __unicode__(self):
		return '%s for %s on %s' % (self.member.display_first, self.show.venue, self.show.date.strftime('%m/%d/%y'))