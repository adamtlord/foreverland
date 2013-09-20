from django.conf.urls import patterns, url


urlpatterns = patterns('marketing.views',
    url(r'^$', 'homepage', {}, name='homepage'),
)
