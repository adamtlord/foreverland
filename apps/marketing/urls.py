from django.conf.urls import patterns, url


urlpatterns = patterns('marketing.views',
    url(r'^$', 'homepage', {}, name='homepage'),
    url(r'^about/$', 'about', {}, name='about'),
    url(r'^faq/$', 'faq', {}, name='faq'),
    url(r'^video/$', 'video', {}, name='video'),
    url(r'^booking/$', 'booking', {}, name='booking'),
)
