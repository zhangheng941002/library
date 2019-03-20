from django.shortcuts import render

from decimal import Decimal

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.transaction import atomic
from .models import User
from seat.models import *
from .serializers import UserSerializer
import json
import datetime

from .islogin import islogin


# 通过名称查询学生
@api_view(["GET"])
def get_user(request):
    data = request.GET
    username = data.get("username", None)
    data_query = {
        "username__contains": username
    }
    query_dict = {k: v for k, v in data_query.items() if v != None}
    user = User.objects.filter(status=1).filter(**query_dict)
    serializer = UserSerializer(user, many=True)
    return Response({"status": 1, "return": serializer.data})


# 用户注册
@api_view(["POST"])
def add_user(request):
    data = request.data
    username = data.get("username")
    password = data.get("password")
    email = data.get("email")
    major = data.get("major")

    user = User.objects.create(username=username, password=password, email=email, major=major, status=1)
    user_id = user.id
    blank_count = UserDefaultRecord.objects.create(user_id=user_id, count=0)
    return Response({
        "status": 1,
        "msg": "成功",

    })


# 修改用户信息
@api_view(["POST"])
@islogin
def update_user(request):
    """
    修改、删除
        修改：
            必传字段：id
            可传字段：username(用户名)，password（密码），email（邮箱）， major（专业）
        删除：
            必传字段：id
                      status：删除为 0

    """
    data = request.data
    id = data.get("id")
    username = data.get("username")
    password = data.get("password")
    email = data.get("email")
    major = data.get("major")
    status = data.get("status")

    data_update = {
        "username": username,
        "password": password,
        "email": email,
        "major": major,
        "status": status,
    }
    user = User.objects.filter(id=id).update(**data_update)

    return Response({
        "status": 1,
        "msg": "修改信息成功",

    })


# 用户预约座位
# @api_view(["POST"])
@islogin
def user_seat(request):
    """
    选择楼层，选择座位，选择时间段进行预约
    可用时间段：08:00:00-21:00:00

    限制：
        1、只能对一个周内的座位进行预约占座
        2、在黑名单中的预约不能在预约座位
    """
    if request.method == "GET":
        user_id = request.session.get('user_id')
        if user_id:
            return render(request, 'date_choose/choosedate.html')
        else:
            return render(request, 'date_choose/nochoosedate.html')

    # form 表单post请求过来的

    if request.method == "POST":

        data = request.POST

        user_id = request.session.get('user_id')

        floor_id = data.get("floor_id")
        seat_id = data.get("seat_id")
        start_date = data.get("start_date", None)
        end_date = data.get("end_date", None)

        if start_date == None or end_date == None or len(start_date) == 0 or len(end_date) == 0:
            return render(request, 'date_choose/choosedate_success.html', {"status": 1, "msg": "请出入预约的开始时间和结束时间。"})

        start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d %H:%M:%S")
        end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d %H:%M:%S")

        # 先查询预约用户是否在黑名单中
        blank_logs = BlankLogs.objects.filter(user_id=user_id, status=1)

        if blank_logs.exists():
            return render(request, 'date_choose/choosedate_success.html', {"status": 1, "msg": "您违约已经5次，不能预约座位。"})

        # 查询是否被占用

        cz = end_date - start_date
        hour = cz.seconds // 3600
        pd_start_date = start_date
        if hour > 1:
            for i in range(1, hour * 2 + 1):
                pd_time = pd_start_date + datetime.timedelta(minutes=30)

                data_query = {
                    "floor_id": floor_id,
                    "seat_id": seat_id,
                    "start_date__lt": pd_time,
                    "end_date__gt": pd_time,
                    "is_come": 0
                }
                pd_start_date = pd_time
                seat3 = SeatDate.objects.filter(**data_query)
                if seat3.exists():
                    return render(request, 'date_choose/choosedate_success.html',
                                  {"status": 1, "msg": "该时间段已被预约，请重新选择。"})

        else:
            data_query = {
                "floor_id": floor_id,
                "seat_id": seat_id,
                "start_date__lt": start_date + datetime.timedelta(minutes=30),
                "end_date__gt": start_date + datetime.timedelta(minutes=30),
                "is_come": 0
            }
            seat3 = SeatDate.objects.filter(**data_query)

            if seat3.exists():
                return render(request, 'date_choose/choosedate_success.html', {"status": 1, "msg": "该时间段已被预约，请重新选择。"})

        use_seat = SeatDate.objects.create(user_id=user_id, seat_id=seat_id, floor_id=floor_id, start_date=start_date,
                                           end_date=end_date,
                                           create_date=datetime.datetime.utcnow() + datetime.timedelta(hours=8),
                                           status=1, is_come=0)
        return render(request, 'date_choose/choosedate_success.html', {"status": 1, "msg": "预约成功"})


# 取消预约
@api_view(["POST"])
def del_seat(request):
    """

    """
    data = request.data
    id = data.get("id")
    user_id = data.get("user_id")

    data_query = {
        "user_id": user_id,
        "id": id,
    }
    seat_date = SeatDate.objects.filter(**data_query).update(status=0)
    if seat_date:
        return Response({"status": 1, "msg": "取消预约成功", })
    else:
        return Response({"status": 0, "msg": "取消预约失败，没有查到预约信息", })


# 确认入场
@api_view(["POST"])
def start_use_seat(request):
    """

    """
    data = request.data
    id = data.get("id")
    user_id = data.get("user_id")

    data_query = {
        "user_id": user_id,
        "id": id,
    }
    seat_date = SeatDate.objects.filter(**data_query).update(is_come=1)
    if seat_date:
        return Response({"status": 1, "msg": "签到成功", })
    else:
        return Response({"status": 0, "msg": "签到失败，没有查到预约信息。"})


@api_view(["POST"])
def end_use_seat(request):
    """
    座位使用结束
    :param request: user_id（用户id），floor_id（楼层id），seat_id（座位id）
    :return: 结束该座位的使用
    """
    data = request.data
    resp = SeatDate.objects.filter(**data).filter(status=1, is_come=1).update(status=2)
    return Response({"status": 1, "msg": "座位使用结束"})


# 预约座位，爽约
@api_view(["POST"])
def break_promise_seat(request):
    """

    """
    data = request.data
    end_time = datetime.datetime.utcnow() + datetime.timedelta(hours=8)

    seat_date = SeatDate.objects.filter(end_date__lte=end_time, is_come=0)
    for each in seat_date:
        # 记录违约记录

        user_id = each.user_id
        record = UserDefaultRecord.objects.get(user_id=user_id)
        if record.count < 5:
            record.count = record.count + 1
            record.save()
        if record.count == 5:
            blank_log = BlankLogs.objects.filter(user_id=user_id).update(status=1)
    seat_date.update(is_come=2)

    return Response({"status": 1, "msg": "爽约记录成功!"})
