import requests, json
import random
import itchat
from django.conf import settings

itchat.auto_login(hotReload=True)


def send_message_to_me():
    # 定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0qwertyuiopasdfghjklzxcvbnm'
    # 随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]

    users = itchat.search_friends(name=settings.WX_USERNAME)  # 使用备注名来查找实际用户名
    # 获取`UserName`,用于发送消息
    userName = users[0]['UserName']
    itchat.send("学习的验证码为：{}".format(rand_str), toUserName=userName)
    return {"status": 1, "wxyzm": rand_str}


if __name__ == '__main__':
    send_message_to_me()
