from django.conf.urls import url
from rest_framework import routers
from .views import *
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)


urlpatterns = router.urls
urlpatterns.append(url(r'get_floor', get_floor))  # 获取楼层信息
urlpatterns.append(url(r'get_seat', get_seat))  # 获取座位信息
