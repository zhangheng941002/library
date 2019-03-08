from django.db import models


# Create your models here.

class User(models.Model):
    username = models.CharField(max_length=255, verbose_name='用户名', db_column='username')
    password = models.CharField(max_length=255, verbose_name='密码', db_column='password')
    email = models.CharField(max_length=255, verbose_name='邮箱', db_column='email')
    major = models.CharField(max_length=255, blank=True, null=True, verbose_name='专业', db_column='major')
    status = models.CharField(max_length=255, blank=True, null=True, verbose_name='是否可用', db_column='status')

    class Meta:
        managed = False
        db_table = 'user'
        verbose_name_plural = '学生信息'

