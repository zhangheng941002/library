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
    result_list = []
    if seat_id == None:

        dict1 = {}
        dict2 = {}
        dict3 = {}
        dict4 = {}
        dict5 = {}
        for i in range(1, 26):
            data_query['seat_id'] = i
            query_dict = {k: v for k, v in data_query.items() if v != None}
            seat = SeatDate.objects.filter(**query_dict).filter(status=1)
            if 0 < i < 6:
                if seat.exists():
                    dict1[i] = 1
                else:
                    dict1[i] = 0
            if 6 < i < 11:
                if seat.exists():
                    dict2[i] = 1
                else:
                    dict2[i] = 0
            if 10 < i < 16:
                if seat.exists():
                    dict3[i] = 1
                else:
                    dict3[i] = 0
            if 15 < i < 21:
                if seat.exists():
                    dict4[i] = 1
                else:
                    dict4[i] = 0
            if 20 < i < 26:
                if seat.exists():
                    dict5[i] = 1
                else:
                    dict5[i] = 0
        result_list.append(dict1)
        result_list.append(dict2)
        result_list.append(dict3)
        result_list.append(dict4)
        result_list.append(dict5)
    else:
        query_dict = {k: v for k, v in data_query.items() if v != None}
        seat = SeatDate.objects.filter(**query_dict).filter(status=1)
        if seat.exists():
            ss = 1
        else:
            ss = 0
        result_list.append({seat_id: ss})
    return Response({"status": 1, "return": result_list})


@api_view(["GET"])
def get_all_seat(request):
    """
    查询座位
    """
    user = Seat.objects.all()
    count = user.count()
    result = [
        {1: 1, 2: 2, 3: 3, 4: 4, 5: 5},
        {6: 6, 7: 7, 8: 8, 9: 9, 10: 10},
        {11: 11, 12: 12, 13: 13, 14: 14, 15: 15},
        {16: 16, 17: 17, 18: 18, 19: 19, 20: 20},
        {21: 21, 22: 22, 23: 23, 24: 24, 25: 25},
    ]
    # for i in range(1,6):
    #     limit, offset = get_page_limit(5, i)
    #     user = user[limit: offset]
    #     serializer = SeatSerializer(user, many=True)
    #     result.append({i:serializer.data})

    return Response({"status": 1, "count": count, "return": result})
