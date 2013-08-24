from django.conf.urls import patterns, url


urlpatterns = patterns('media.views',
    url(r'^$', 'main', {}, name='main'),
    url(r'^(\d+)/(full|thumbnails|edit)/$', 'album', {}, name='album'),
    url(r'^image/(\d+)/$', 'image', {}, name='image'),
    url(r'^update/$', 'update', {}, name='update'),
    url(r'^search/$', 'search', {}, name='search'),
)
