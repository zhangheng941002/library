from django.conf.urls import url
from rest_framework import routers
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)

urlpatterns = router.urls
urlpatterns.append(url(r'set_blank', set_blank))  # 设置黑名单
urlpatterns.append(url(r'del_blank', del_blank))  # 取消黑名单
urlpatterns.append(url(r'email_msg', email_msg))  # 发送邮件提醒

