from django.contrib import admin

from seat.models import *


class FloorBulidingAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["number", "status"]
    # 每页显示几条
    list_per_page = 10


class SeatAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["seat_num", "status"]
    # 每页显示几条
    list_per_page = 10


class SeatDateAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["username", "floor_id", "seat_id", "start_date", "end_date", "status", "is_come"]
    # 每页显示几条
    list_per_page = 10


class UserDefaultRecordAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["username", "count"]
    # 每页显示几条
    list_per_page = 10


class BlankLogsAdmin(admin.ModelAdmin):
    # 后台展示的字段,展示标题，分类，谁提交的
    list_display = ["username", "status"]
    # 每页显示几条
    list_per_page = 10


admin.site.register(FloorBuliding, FloorBulidingAdmin)
admin.site.register(Seat, SeatAdmin)
admin.site.register(SeatDate, SeatDateAdmin)
admin.site.register(UserDefaultRecord, UserDefaultRecordAdmin)
admin.site.register(BlankLogs, BlankLogsAdmin)
