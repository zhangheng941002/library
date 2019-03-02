from rest_framework import serializers
from .models import Seat, SeatDate, BlankLogs, FloorBuliding


class FloorBulidingSerializer(serializers.ModelSerializer):

    class Meta:
        model = FloorBuliding
        fields = '__all__'
        depth = 1


class SeatSerializer(serializers.ModelSerializer):

    class Meta:
        model = Seat
        fields = '__all__'
        depth = 1


class SeatDateSerializer(serializers.ModelSerializer):

    class Meta:
        model = SeatDate
        fields = '__all__'
        depth = 1


class BlankLogsSerializer(serializers.ModelSerializer):

    class Meta:
        model = BlankLogs
        fields = '__all__'
        depth = 1


