from django.core.management.base import BaseCommand, CommandError

from legacy.models import WpRandomText
from marketing.models import Testimonial

class Command(BaseCommand):
	def handle(self, *args, **options):
		print 'run the etl command'