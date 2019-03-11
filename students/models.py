from django.db import models
from django.utils.html import format_html


# Create your models here.

class User(models.Model):
    status_choice = (
        (1, "正常"),
        (0, "注销")
    )

    username = models.CharField(max_length=255, verbose_name='用户名', db_column='username')
    password = models.CharField(max_length=255, verbose_name='密码', db_column='password')
    email = models.CharField(max_length=255, verbose_name='邮箱', db_column='email')
    major = models.CharField(max_length=255, blank=True, null=True, verbose_name='专业', db_column='major')
    status = models.CharField(max_length=255, blank=True, null=True, verbose_name='是否可用', db_column='status',
                              choices=status_choice)

    def colord_password(self):
        if self.password == "123456":
            color_code = "red"
        else:
            color_code = "blank"
        return format_html(
            '<span style="color: #{};">{}</span>',
            color_code,
            self.password,
        )

    colord_password.allow_tags = True

    class Meta:
        managed = False
        db_table = 'user'
        verbose_name_plural = '学生信息'
