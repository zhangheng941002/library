from django.apps import AppConfig
import os

default_app_config = 'seat.PrimaryBlogConfig'

VERBOSE_APP_NAME = "座位预约管理"


def get_current_app_name(_file):
    return os.path.split(os.path.dirname(_file))[-1]


class PrimaryBlogConfig(AppConfig):
    name = get_current_app_name(__file__)
    verbose_name = VERBOSE_APP_NAME
