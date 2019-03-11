from django.contrib import admin

from students.models import *


class UserAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["username", "password", "email", "major", "status"]
    # 每页显示几条
    list_per_page = 10

    # # list_editable 设置默认可编辑字段
    # list_editable = ['username', 'email']

    # 筛选器
    list_filter = ("major", "status")  # 过滤器
    search_fields = ("username", "email")  # 搜索字段


admin.site.register(User, UserAdmin)
