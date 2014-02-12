from django.conf.urls import patterns, url


urlpatterns = patterns('fidouche.views',
    url(r'^$', 'financial_dashboard', {}, name='financial_dashboard'),
	url(r'^gigs/year/(?P<year>\d{4})/','gigs_by_year', {}, name='gigs_by_year'),
	url(r'^gigs/(?P<gig_id>\d+)/$','gig_finances', {}, name='gig_finances'),
)
