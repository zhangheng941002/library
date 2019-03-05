from django.shortcuts import render

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.transaction import atomic
from seat.models import BlankLogs
from .serializers import *
import json
import datetime

from utils.page_kit import get_page_limit


# 设置黑名单
@api_view(["POST"])
def set_blank(request):
    """

    """
    data = request.data
    user_id = data.get("user_id")

    data_set = {
        "user_id": user_id,
        "status": 1,
    }
    seat_date = BlankLogs.objects.filter(**data_set)
    if seat_date:
        return Response({"statusCode": 1, "msg": "拉黑成功成功！", })
    else:
        return Response({"statusCode": 0, "msg": "拉黑失败！", })
