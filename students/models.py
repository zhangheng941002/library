from django.db import models


# Create your models here.

class User(models.Model):
    username = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    major = models.CharField(max_length=255, blank=True, null=True)
    status = models.IntegerField(default=1)

    class Meta:
        managed = False
        db_table = 'user'
