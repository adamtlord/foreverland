from django.conf.urls import patterns, url


urlpatterns = patterns('members.views',
    url(r'^$', 'list_members', {}, name='list_members'),
)
