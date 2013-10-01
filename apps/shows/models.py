from django.db import models
from django.contrib.localflavor.us.models import PhoneNumberField, USStateField


class Venue(models.Model):
    venue_name = models.CharField(max_length=200, blank=True, null=True)
    venue_image = models.ImageField(upload_to='venues/', blank=True)
    address1 = models.CharField(max_length=100, blank=True, null=True)
    address2 = models.CharField(max_length=100, blank=True, null=True)
    city = models.CharField(max_length=100, blank=True, null=True)
    state = USStateField(max_length=50, blank=True, null=True)
    zip_code = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=100, blank=True, null=True, default="U.S.A.")
    phone = PhoneNumberField(blank=True, null=True)
    website = models.URLField(max_length=200, blank=True, null=True)
    contact = models.CharField(max_length=100, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    def __unicode__(self):
        return self.venue_name


class Show(models.Model):
    # Open to the public/Display on public calendar?
    public = models.BooleanField(default=True)
    # Public Information
    venue = models.ForeignKey(Venue, related_name='venue')
    date = models.DateTimeField()
    doors_time = models.TimeField(blank=True, null=True)
    ticket_price = models.CharField(max_length=100, blank=True, null=True)
    ticket_url = models.URLField(max_length=200, blank=True, null=True)
    ages = models.CharField(max_length=100, blank=True, null=True)
    opener = models.CharField(max_length=200, blank=True, null=True)
    notes = models.TextField(blank=True, null=True)
    # Financial Information
    gross = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    commission = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    sound_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    in_ears_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    print_ship_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    ads_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    other_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    net = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    payout = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    to_account = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)


    class Meta:
        ordering = ['date']

    def __unicode__(self):
        return '%s %s' % (self.date.strftime('%m/%d/%y'), self.venue)
