from django.conf.urls import url
from rest_framework import routers
from .views import *
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)


urlpatterns = router.urls
urlpatterns.append(url(r'get_floor', get_floor))
urlpatterns.append(url(r'get_seat', get_seat))
