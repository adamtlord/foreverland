from django.conf.urls import patterns, url


urlpatterns = patterns('songs.views',
    url(r'^$', 'list_songs', {}, name='list_songs'),
)
