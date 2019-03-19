from django.conf.urls import url
from rest_framework import routers
from .views import *
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)


urlpatterns = router.urls
urlpatterns.append(url(r'get_floor', get_floor))  # 获取楼层信息
urlpatterns.append(url(r'get_use_all_seat', get_use_all_seat))  # 获取座位信息
urlpatterns.append(url(r'get_only_seat_use_info', get_only_seat_use_info))  # 获取某个座位的预约信息
urlpatterns.append(url(r'get_myself_use_info', get_myself_use_info))  # 用户获取预约的可用的座位信息
