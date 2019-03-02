from django.db import models


# Create your models here.

class FloorBuliding(models.Model):
    id = models.IntegerField(primary_key=True)
    number = models.IntegerField()
    status = models.DecimalField(max_digits=19, decimal_places=0)

    class Meta:
        managed = False
        db_table = 'floor_buliding'


class Seat(models.Model):
    seat_num = models.IntegerField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'seat'


class SeatDate(models.Model):
    id = models.IntegerField(primary_key=True)
    seat_date = models.DateTimeField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'seat_date'


class UserDefaultRecord(models.Model):
    user_id = models.IntegerField()
    conut = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'user_default_record'


class BlankLogs(models.Model):
    user_id = models.IntegerField()
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'blank_logs'
