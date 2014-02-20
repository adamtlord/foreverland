from django.conf.urls import patterns, url


urlpatterns = patterns('fidouche.views',
    url(r'^$', 'financial_dashboard', {}, name='financial_dashboard'),
	url(r'^gigs/year/(?P<year>\d{4})/','gigs_by_year', {}, name='gigs_by_year'),
	url(r'^gigs/year-over-year','gigs_year_over_year', {}, name='gigs_year_over_year'),
	url(r'^gigs/(?P<gig_id>\d+)/$','gig_finances', {}, name='gig_finances'),
)
