from django.shortcuts import render

from decimal import Decimal

from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.db.transaction import atomic
from .models import User
from .serializers import UserSerializer
import json
import datetime


@api_view(["GET"])
def get_user(request):
    data = request.GET
    username = data.get("username", None)
    data_query = {
        "username__contains": username
    }
    query_dict = {k: v for k, v in data_query.items() if v != None}
    user = User.objects.filter(**query_dict)
    serializer = UserSerializer(user, many=True)
    return Response({"status": 1, "return": serializer.data})


@api_view(["POST"])
def add_user(request):
    data = request.data
    username = data.get("username")
    password = data.get("password")
    email = data.get("email")
    major = data.get("major")

    user = User.objects.create(username=username, password=password, email=email, major=major, status=1)
    return Response({
        "statusCode": 1,
        "msg": "成功",

    })


@api_view(["POST"])
def update_user(request):
    data = request.data
    id = data.get("id")
    username = data.get("username")
    password = data.get("password")
    email = data.get("email")
    major = data.get("major")

    data_update = {
        "username": username,
        "password": password,
        "email": email,
        "major": major,
    }
    user = User.objects.filter(id=id).update(**data_update)

    return Response({
        "statusCode": 1,
        "msg": "修改信息成功",

    })
