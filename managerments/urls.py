from django.conf.urls import url
from rest_framework import routers
from .views import *
# from rest import views as rest_views
router = routers.DefaultRouter(trailing_slash=False)

urlpatterns = router.urls
urlpatterns.append(url(r'contract_upload', contract_upload))
urlpatterns.append(url(r'contract_download', contract_download))
