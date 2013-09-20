from django_ical.views import ICalFeed

from shows.models import Show


class CalendarFeed(ICalFeed):
	"""An iCal feed of upcoming events"""
	product_id = '-//foreverlandsf.com//Example//EN'
	timezone = 'UTC'
	title = 'Foreverland Upcoming Shows'

	def items(self):
		return Show.objects.filter(public=True).order_by('date')

	def item_title(self, item):
		return '%s - %s' % (item.venue, item.date.strftime('%I:%M %p'))

	def item_description(self, item):
		return 'Doors at %s; Ticket price: %s; Ages: %s' % (item.doors_time, item.ticket_price, item.ages)

	def item_start_datetime(self, item):
		return item.date

	def item_link(self, item):
		return '/shows/%s/' % (item.id)

	def item_class(self):
		return 'PUBLIC'

	def item_location(self, item):
		loc = item.venue.address1
		if item.venue.address2:
			loc += ', ' + item.venue.address2
		loc += ', ' + item.venue.zip_code
		return loc