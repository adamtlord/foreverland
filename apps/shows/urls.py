from django.conf.urls import patterns, url

from shows.feeds import CalendarFeed


urlpatterns = patterns('shows.views',
    url(r'^$', 'upcoming_shows', {}, name='upcoming_shows'),
    url(r'^(?P<show_id>\d+)/$', 'show', {}, name='show'),
    url(r'^ical/$', CalendarFeed())
)
