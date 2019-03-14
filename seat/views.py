from django.shortcuts import render

from decimal import Decimal

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.transaction import atomic
from .models import Seat, SeatDate, BlankLogs, FloorBuliding
from .serializers import SeatSerializer, SeatDateSerializer, BlankLogsSerializer, FloorBulidingSerializer
import json
import datetime

from utils.page_kit import get_page_limit


@api_view(["GET"])
def get_floor(request):
    """
    查询楼层
    """
    data = request.GET
    floor_id = data.get("floor_id", None)
    page_size = data.get("page_size", 10)
    page = data.get("page", 1)

    limit, offset = get_page_limit(page_size, page)

    data_query = {
        "floor_id": floor_id
    }
    query_dict = {k: v for k, v in data_query.items() if v != None}
    user = FloorBuliding.objects.filter(**query_dict)
    count = user.count()
    user = user[limit: offset]
    serializer = FloorBulidingSerializer(user, many=True)
    return Response({"status": 1, "count": count, "return": serializer.data})


@api_view(["GET"])
def get_seat(request):
    """
    查询座位:   floor_id 必传
            1、默认通过楼层去查询该楼层所有座位,显示目前是否被占用
            2、拿着楼层id 和 座位id 去 楼层座位使用情况记录表（SeatDate）查询当前时间是否在使用
    """
    data = request.GET
    floor_id = int(data.get("floor_id"))
    seat_id = None
    if data.get("seat_id"):
        seat_id = int(data.get("seat_id"))
    start_date = data.get("start_date", None)
    end_date = data.get("end_date", None)

    if start_date:
        start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d %H:%M:%S")
    if end_date:
        end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d %H:%M:%S")

    data_query = {
        "floor_id": floor_id,
        "seat_id": seat_id,
        "start_date__gte": start_date,
        "end_date__lte": end_date,
    }

    if start_date == None:
        now = datetime.datetime.now()

        data_query = {
            "floor_id": floor_id,
            "seat_id": seat_id,
            "start_date__lt": now,
            "end_date__gt": now,
        }

    query_dict = {k: v for k, v in data_query.items() if v != None}
    seat = SeatDate.objects.filter(**query_dict).filter(status=1)
    serializer = SeatDateSerializer(seat, many=True)
    return Response({"status": 1, "return": serializer.data})


@api_view(["GET"])
def get_all_seat(request):
    """
    查询座位
    """
    user = Seat.objects.all()
    count = user.count()

    serializer = SeatSerializer(user, many=True)
    return Response({"status": 1, "count": count, "return": serializer.data})

