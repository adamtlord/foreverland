from django.conf.urls import patterns, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.views.generic.base import RedirectView

admin.autodiscover()

urlpatterns = patterns('',
    (r'^', include('marketing.urls')),
    (r'^accounts/', include('accounts.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^members/', include('members.urls')),
    (r'^shows/', include('shows.urls')),
    (r'^songs/', include('songs.urls')),
    (r'^photos/', include('media.urls')),
    (r'^fidouche/', include('fidouche.urls')),
    (r'^setter/', include('setter.urls')),
    (r'^downloads/', 'media.views.downloads'),
    (r'^behind-the-music/', 'media.views.behind_the_music'),
    # Legacy redirects
    (r'^upcoming-shows/', RedirectView.as_view(url='/shows', permanent=True)),
    (r'^past-shows/', RedirectView.as_view(url='/shows/past', permanent=True)),
    (r'^song-list/', RedirectView.as_view(url='/songs', permanent=True)),
    (r'^news-press/', RedirectView.as_view(url='/', permanent=True)),
    (r'^quotes/', RedirectView.as_view(url='/about#quotes', permanent=True)),
    (r'^catalog/', RedirectView.as_view(url='http://v2.foreverland.com/catalog/', permanent=True)),
    (r'^theworks/', RedirectView.as_view(url='http://v2.foreverland.com/theworks/', permanent=True)),
)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^404/$', 'django.views.defaults.page_not_found'),
        (r'^500/$', 'django.views.defaults.server_error'),
    )


