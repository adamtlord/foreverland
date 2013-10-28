from random import randint

from django.core.urlresolvers import reverse

from marketing.models import Testimonial


def random_quote(request):
	quote_count = Testimonial.objects.filter(featured=True).count()
	random_quote = Testimonial.objects.filter(featured=True).all()[randint(0, quote_count-1)]
	return {'random_quote': random_quote }
