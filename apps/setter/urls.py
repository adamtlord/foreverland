from django.conf.urls import patterns, url
from rest_framework import routers
from setter import views



urlpatterns = patterns('setter.views',
    url(r'^$', 'setter_dashboard', {}, name='setter_dashboard'),
    url(r'^show/(?P<gig_id>\d+)/$', 'view_setlist', {}, name='view_setlist'),
    url(r'^show/(?P<gig_id>\d+)/edit/', 'edit_setlist', {}, name='edit_setlist'),
    url(r'^test/', 'setter_test', {}, name='setter_test'),
    # url(r'^show/(?P<gig_id>\d+)/create/', 'create_setlist', {}, name='create_setlist'),


)
