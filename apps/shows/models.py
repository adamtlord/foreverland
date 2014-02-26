from django.db import models
from django.contrib.localflavor.us.models import PhoneNumberField, USStateField

from common.utils import get_lat_lng


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
    ltlng = models.CharField(max_length=100, blank=True, null=True)

    def save(self, *args, **kwargs):
        """ Let's get the latlng before we save"""
        super(Venue, self).save(*args, **kwargs)
        if not self.ltlng:
            address = '%s %s %s' % (self.address1, self.address2, self.zip_code)
            try:
                self.ltlng = get_lat_lng(address)
            except Exception:
                raise Exception
            super(Venue, self).save(*args, **kwargs)

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
    poster = models.FileField(upload_to='posters/', blank=True, null=True)
    fb_event = models.CharField(max_length=200, blank=True, null=True)
    # Financial Information
    AGENT = 'DS'
    CLIENT = 'client'
    CASH = 'cash'
    CHECK = 'check'
    PAYEE_CHOICES = (
        (CLIENT, 'Client'),
        (AGENT, 'Swan Entertainment'),
    )
    METHOD_CHOICES = (
        (CASH, 'Cash'),
        (CHECK, 'Check'),
    )
    IEM_CHOICES = (
        (80, '$80'),
        (130, '$130'),
    )
    attendance = models.IntegerField(blank=True, null=True)
    gross = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    gross_method = models.CharField(max_length=100, blank=True, null=True, choices=METHOD_CHOICES, default=CASH)
    payer = models.CharField(max_length=100, blank=True, null=True, choices=PAYEE_CHOICES, default=CLIENT)
    payee_check_no = models.IntegerField(blank=True, null=True)
    commission = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    commission_withheld = models.BooleanField(default=False)
    commission_check_no = models.IntegerField(blank=True, null=True)
    sound_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    sound_check_no = models.IntegerField(blank=True, null=True)
    in_ears_cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, choices=IEM_CHOICES, default=130)
    in_ears_check_no = models.IntegerField(blank=True, null=True)
    costs_itemized = models.BooleanField(default=False)
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


class Expense(models.Model):
    EXPENSE_CATEGORIES = (
        ('print','printing'),
        ('ship','shipping'),
        ('ads','ads'),
        ('other','other'),
    )
    show = models.ForeignKey(Show, related_name="expense", blank=True, null=True)
    date = models.DateField(blank=True, null=True)
    payee = models.CharField(max_length=100, blank=True, null=True)
    category = models.CharField(max_length=100, blank=True, null=True, choices=EXPENSE_CATEGORIES)
    amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    check_no = models.IntegerField(blank=True, null=True, verbose_name="Check #")
    notes = notes = models.TextField(blank=True, null=True)

    def __unicode__(self):
        return '%s, $%s to %s' % (self.date.strftime('%n/%j/%y'), self.amount, self.payee)

