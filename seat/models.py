from django.db import models


# Create your models here.

# 楼层信息表
class FloorBuliding(models.Model):
    id = models.IntegerField(primary_key=True)
    number = models.IntegerField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'floor_buliding'


# 座位表
class Seat(models.Model):
    seat_num = models.IntegerField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'seat'


# 楼层座位使用情况记录表
class SeatDate(models.Model):
    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField()
    floor_id = models.IntegerField()
    seat_id = models.IntegerField()
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    status = models.IntegerField()
    is_come = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'seat_date'


# 违约记录表
class UserDefaultRecord(models.Model):
    user_id = models.IntegerField()
    count = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'user_default_record'


# 黑名单表
class BlankLogs(models.Model):
    user_id = models.IntegerField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'blank_logs'
