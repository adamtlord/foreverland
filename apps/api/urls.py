from django.conf.urls import patterns, url, include
from rest_framework.urlpatterns import format_suffix_patterns
from api import views

urlpatterns = patterns('',
    url(r'^songs/$', views.SongList.as_view()),
    url(r'^songs/(?P<pk>[0-9]+)/$', views.SongDetail.as_view()),
    url(r'^setlists/$', views.SetlistList.as_view()),
    url(r'^setlists/(?P<gig_id>[0-9]+)/$', views.setlist_detail),
    url(r'^members/$', views.MemberList.as_view()),
    url(r'^members/(?P<pk>[0-9]+)/$', views.MemberDetail.as_view())
)

urlpatterns += patterns('',
    url(r'^api-auth/', include('rest_framework.urls',
                               namespace='rest_framework')),
)

urlpatterns = format_suffix_patterns(urlpatterns)