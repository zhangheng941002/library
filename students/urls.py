from django.conf.urls import url
from rest_framework import routers
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)

# router.register(r'demo', Demo, base_name='demo')

urlpatterns = router.urls
urlpatterns.append(url(r'user_info', user_info))  # 获取用户的个人信息
urlpatterns.append(url(r'add_user', add_user))  # 注册
urlpatterns.append(url(r'get_user', get_user))  # 获取用户信息
urlpatterns.append(url(r'update_user', update_user))  # 更新用户信息
urlpatterns.append(url(r'user_seat', user_seat))  # 预约座位
urlpatterns.append(url(r'del_seat', del_seat))  # 取消预约
urlpatterns.append(url(r'confirm_seat', start_use_seat))  # 确认入场,预约座位开始使用
urlpatterns.append(url(r'break_promise_seat', break_promise_seat))  # 预约座位，爽约
urlpatterns.append(url(r'end_use_seat', end_use_seat))  # 预约座位使用结束


urlpatterns.append(url(r'query_info', query_info))  # 查询座位的预约信息
