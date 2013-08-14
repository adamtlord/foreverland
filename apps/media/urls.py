from django.conf.urls import patterns, url


urlpatterns = patterns('shows.views',
    url(r'^$', 'upcoming_shows', {}, name='upcoming_shows'),
)
