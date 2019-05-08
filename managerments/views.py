from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.transaction import atomic
from seat.models import BlankLogs, UserDefaultRecord, SeatDate
from students.models import User
from .serializers import *
import json
import datetime
from .send_email import send_email

from utils.page_kit import get_page_limit


# 设置黑名单
@api_view(["POST"])
def set_blank(request):
    """

    """
    data = request.data
    user_id = data.get("user_id")
    username = data.get("username")

    data_set = {
        "user_id": user_id,
        "username": username,
        "status": 1

    }
    log = BlankLogs.objects.filter(user_id=user_id)
    if log:
        log.update(status=1)
    else:

        log = BlankLogs.objects.get_or_create(**data_set)

    if log:
        return Response({"status": 1, "msg": "拉黑成功成功！", })
    else:
        return Response({"status": 0, "msg": "拉黑失败！", })


# 取消黑名单
@api_view(["POST"])
def del_blank(request):
    """

    """
    data = request.data
    user_id = data.get("user_id")

    seat_date = BlankLogs.objects.filter(user_id=user_id).update(status=0)

    blank_count = UserDefaultRecord.objects.filter(user_id=user_id).update(count=0)

    return Response({"status": 1, "msg": "取消拉黑成功！", })


# 发送邮件提醒
@api_view(["POST"])
def email_msg(request):
    """

    """
    now = datetime.datetime.utcnow() + datetime.timedelta(hours=8) + datetime.timedelta(minutes=15)

    now = now.strftime("%Y-%m-%d %H:%M:%S")
    print(now)
    seat = SeatDate.objects.filter(start_date=now)
    if seat.exists():
        for each in seat:
            user_id = each.user_id
            email = User.objects.get(id=user_id)
            resp = send_email(email.email, "你预定的座位还有十分钟就进入了学习时间，请注意！")

        return Response({"status": 1, "msg": "邮件发送成功！", })
    else:
        return Response({"status": 0, "msg": "没有用户满足条件", })
