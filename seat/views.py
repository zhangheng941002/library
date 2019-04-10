from django.shortcuts import render

from decimal import Decimal

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.transaction import atomic
from .models import Seat, SeatDate, BlankLogs, FloorBuliding
from students.models import User
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

    session_user_id = request.session.get('user_id')

    limit, offset = get_page_limit(page_size, page)

    data_query = {
        "floor_id": floor_id
    }
    query_dict = {k: v for k, v in data_query.items() if v != None}
    user = FloorBuliding.objects.filter(**query_dict)
    count = user.count()
    user = user[limit: offset]
    serializer = FloorBulidingSerializer(user, many=True)
    # return Response({"status": 1, "count": count, "return": serializer.data})
    if session_user_id:
        return render(request, '25gongge/floor.html', {"results": user})
    else:
        return render(request, '25gongge/nofloor.html', {"results": user})



@api_view(["GET"])
def get_use_all_seat(request):
    """
        查询座位:   floor_id 必传
                1、默认通过楼层去查询该楼层所有座位,显示目前是否被占用
                2、如果有 seat_id 则是搜索该楼层该座位使用情况记录表（SeatDate）
                3、如果传入时间则搜索时间，不传查询当前时间是否在被使用
    """
    data = request.GET
    floor_id = data.get("floor_id")
    seat_id = data.get("seat_id")
    start_date = data.get("start_date", None)
    end_date = data.get("end_date")

    username = request.session.get('username')
    user_id = request.session.get('user_id')

    if start_date:
        start_date = datetime.datetime.strptime(start_date, "%Y-%m-%d %H:%M:%S")
    if end_date:
        end_date = datetime.datetime.strptime(end_date, "%Y-%m-%d %H:%M:%S")
    if start_date == None:
        now = datetime.datetime.now()
        query_data = {
            "floor_id": floor_id,
            "start_date__lt": now,
            "end_date__gt": now,
        }
    else:
        query_data = {
            "floor_id": floor_id,
            "start_date__lt": start_date,
            "end_date__gt": end_date,
        }
    data_list = []
    if seat_id == None:
        for i in range(1, 26):
            query_data["seat_id"] = i
            res = SeatDate.objects.filter(**query_data).filter(status=1)
            if res:
                user_id = res[0].user_id
                user = User.objects.get(id=user_id)
                user_name = user.username
                user_cl = user_name[0] + (len(user_name) - 1) * "*"
                major = user.major
                start_date = str(res[0].start_date).replace("T", " ")
                end_date = str(res[0].end_date).replace("T", " ")
                data_list.append({"status": 1, "floor_id": floor_id, "seat_id": i,
                                  "start_date": start_date,
                                  "end_date": end_date,
                                  "msg": "该座位目前已被预约，预约人：{}，预约时间段：{}-{}".format(user_cl, start_date, end_date),
                                  "user_name": user_cl, "major": major})
            else:
                data_list.append(
                    {"status": 0, "floor_id": int(floor_id), "seat_id": i, "start_date": "", "end_date": "",
                     "msg": "该座位目前未被预约"})
    else:
        query_data["seat_id"] = seat_id
        res = SeatDate.objects.filter(**query_data).filter(status=1)
        if res:
            user_id = res[0].user_id
            user = User.objects.get(id=user_id)
            user_name = user.username
            user_cl = user_name[0] + (len(user_name) - 1) * "*"
            major = user.major
            start_date = str(res[0].start_date).replace("T", " ")
            end_date = str(res[0].end_date).replace("T", " ")
            data_list.append({"status": 1, "floor_id": floor_id, "seat_id": int(seat_id),
                              "start_date": start_date,
                              "end_date": end_date,
                              "msg": "该座位目前已被预约，预约人：{}，预约时间段：{}-{}".format(user_cl, start_date, end_date),
                              "user_name": user_cl, "major": major})
        else:
            data_list.append(
                {"status": 0, "floor_id": int(floor_id), "seat_id": int(seat_id), "start_date": "", "end_date": "",
                 "msg": "该座位目前未被预约"})
    return render(request, '25gongge/index.html', {"results": data_list, "count": len(data_list)})
    # return Response({"results": data_list, "count": len(data_list)})


@api_view(["POST"])
def get_only_seat_use_info(request):
    """
    查询某个楼层的某个座位的被预约信息
    :param request: floor_id(楼层id)，seat_id（座位id）
    :return: 该座位的被预约的相关信息
    """

    data = request.data
    print('------------', data)
    username = request.session.get('username')
    user_id = request.session.get('user_id')
    print('-----------', username, user_id, '-----------------')
    resp = SeatDate.objects.filter(**data).filter(status=1)
    serializer = SeatDateSerializer(resp, many=True)
    return Response({"results": serializer.data})


@api_view(['GET'])
def get_myself_use_info(request):
    """
    用户查询自己的预约信息
    :param request: 从session中找登录者的user_id
    :return: 返回用户预约的所有的可使用的座位信息
    """
    data = request.GET

    user_id = request.session.get('user_id')
    resp = SeatDate.objects.filter(user_id=user_id, is_come=0)
    serlise = SeatDateSerializer(resp, many=True)
    return Response({"status": 1, "results": serlise.data})
