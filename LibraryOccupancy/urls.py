"""LibraryOccupancy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from django.conf.urls import url

from .views import *

admin.site.site_header = '图书馆占座管理系统'
admin.site.site_title = '图书馆占座管理系统'
admin.site.index_title = '欢迎登陆'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('students/', include('students.urls')),
    path('seats/', include('seat.urls')),
    path('managers/', include('managerments.urls')),
    url('^$', shouye),
    url('^user/login/$', login),
    url('^user/logout/$', logout),
    url(r'^user/yanzhengma/$', yanzhengma),

]
