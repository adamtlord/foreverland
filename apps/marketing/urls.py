from django.conf.urls import patterns, url


urlpatterns = patterns('marketing.views',
    url(r'^$', 'homepage', {}, name='homepage'),
    url(r'^quotes/$', 'quotes', {}, name='quotes'),
    url(r'^faq/$', 'faq', {}, name='faq'),
    url(r'^songs/$', 'songs', {}, name='songs'),
    url(r'^photos/$', 'photos', {}, name='photos'),
    url(r'^video/$', 'video', {}, name='video'),
    url(r'^booking/$', 'booking', {}, name='booking'),
)
