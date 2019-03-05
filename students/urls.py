from django.conf.urls import url
from rest_framework import routers
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)

# router.register(r'demo', Demo, base_name='demo')

urlpatterns = router.urls
urlpatterns.append(url(r'add_user', add_user))
urlpatterns.append(url(r'get_user', get_user))
urlpatterns.append(url(r'update_user', get_user))
urlpatterns.append(url(r'user_seat', user_seat))
urlpatterns.append(url(r'del_seat', del_seat))
urlpatterns.append(url(r'confirm_seat', confirm_seat))
