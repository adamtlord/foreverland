from django.conf.urls import patterns, url, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns


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
    (r'^downloads/', 'media.views.downloads'),
    (r'^behind-the-music/', 'media.views.behind_the_music'),

)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^404/$', 'django.views.defaults.page_not_found'),
        (r'^500/$', 'django.views.defaults.server_error'),
    )


