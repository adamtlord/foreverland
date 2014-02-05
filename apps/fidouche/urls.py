from django.conf.urls import patterns, url


urlpatterns = patterns('fidouche.views',
    url(r'^$', 'financial_dashboard', {}, name='financial_dashboard'),
	url(r'^gigs/(?P<year>\d{4})/','gig_finance_dashboard', {}, name='gig_finance_dashboard'),
	url(r'^gigs/(?P<gig_id>\d)/$','gig_finances', {}, name='gig_finances'),
)
