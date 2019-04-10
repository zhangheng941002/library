from django.db import models


# Create your models here.

# 楼层信息表
class FloorBuliding(models.Model):
    id = models.IntegerField(primary_key=True)
    number = models.IntegerField(verbose_name='楼层号', db_column='number')
    status = models.IntegerField(verbose_name='占用率', db_column='status')

    class Meta:
        managed = False
        db_table = 'floor_buliding'
        verbose_name_plural = '楼层'


# 座位表
class Seat(models.Model):
    status_choice = (
        (1, "被占用"),
        (0, "未被占用"),
    )
    seat_num = models.IntegerField(verbose_name='座位号', db_column='seat_num')
    status = models.IntegerField(verbose_name='状态', db_column='status', choices=status_choice)

    class Meta:
        managed = False
        db_table = 'seat'
        verbose_name_plural = '座位'


# 楼层座位使用情况记录表
class SeatDate(models.Model):
    status_choice = (

        (1, "已被使用"),
        (2, "使用结束"),
    )

    is_come_choice = (
        (0, "未处理"),
        (1, "履约"),
        (2, "旷约"),
    )

    id = models.IntegerField(primary_key=True)
    user_id = models.IntegerField(verbose_name='用户', db_column='user_id')
    username = models.CharField(max_length=255, verbose_name='用户名', db_column='username')
    floor_id = models.IntegerField(verbose_name='楼层', db_column='floor_id')
    seat_id = models.IntegerField(verbose_name='座位', db_column='seat_id')
    start_date = models.DateTimeField(verbose_name='占用开始时间', db_column='start_date')
    end_date = models.DateTimeField(verbose_name='占用结束时间', db_column='end_date')
    create_date = models.DateTimeField(verbose_name='创建时间', db_column='create_date')
    status = models.IntegerField(verbose_name='使用状态', db_column='status', choices=status_choice)
    is_come = models.IntegerField(verbose_name='应约状态', db_column='is_come', choices=is_come_choice)

    class Meta:
        managed = False
        db_table = 'seat_date'
        verbose_name_plural = '预约座位信息'


# 违约记录表
class UserDefaultRecord(models.Model):
    user_id = models.IntegerField(verbose_name='用户', db_column='user_id')
    username = models.CharField(max_length=255, verbose_name='用户名', db_column='username')
    count = models.IntegerField(verbose_name='违约次数', db_column='count')

    class Meta:
        managed = False
        db_table = 'user_default_record'
        verbose_name_plural = '用户违约次数记录'


# 黑名单表
class BlankLogs(models.Model):
    status_choice = (
        (0, "可以预约"),
        (1, "不能预约"),
    )
    user_id = models.IntegerField(verbose_name='用户', db_column='user_id')
    username = models.CharField(max_length=255, verbose_name='用户名', db_column='username')
    status = models.IntegerField(verbose_name='状态', db_column='status', choices=status_choice)

    class Meta:
        managed = False
        db_table = 'blank_logs'
        verbose_name_plural = '预约黑名单'
