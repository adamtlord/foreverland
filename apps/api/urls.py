from . import views
from django.conf.urls import patterns, url, include
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'members', views.MemberViewSet)
router.register(r'songs', views.SongViewSet)
router.register(r'setlists', views.SetlistViewSet)
router.register(r'shows', views.ShowViewSet)
router.register(r'venues', views.VenueViewSet)

urlpatterns = patterns('',
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
)
