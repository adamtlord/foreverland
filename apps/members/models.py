from django.db import models

class Member(models.Model):
    first_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    middle_name = models.CharField(max_length=50, blank=True, null=True)
    display_name = models.CharField(max_length=50, blank=True, null=True)
    instrument = models.CharField(max_length=100, blank=True, null=True)
    dob = models.DateField(verbose_name="Date of Birth", blank=True, null=True)
    join_date = models.DateField(verbose_name="Date of Joining", blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    active = models.BooleanField()

    def __unicode__(self):
        return '%s %s' % (self.first_name, self.last_name)
