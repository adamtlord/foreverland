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
    (r'^media/', include('media.urls')),

) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

if settings.IS_PROD:
	urlpatterns += staticfiles_urlpatterns()
