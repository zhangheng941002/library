from django.contrib import admin

from students.models import *


class UserAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["username", "email", "major", "status"]
    # 每页显示几条
    list_per_page = 10


admin.site.register(User, UserAdmin)
