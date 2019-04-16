from django.http import JsonResponse
import requests, json
import random


def send_message_to_me(request):
    # 定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0qwertyuiopasdfghjklzxcvbnm'
    # 随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]

    URL_ALL_SEND = "https://pushbear.ftqq.com/sub"
    data = {
        "sendkey": "6962-af2e7efda87026038823894cc68ad126",  # 验证码
        "text": "开始学习的验证码",
        "desp": "您的验证码是 {}".format(rand_str),
    }
    resp = requests.post(url=URL_ALL_SEND, data=data)
    resp = json.loads(resp.content)
    # print(resp)
    if resp.get("code") == 0:
        print(resp.get("data"))

    response = JsonResponse({'st': rand_str})
    response.set_cookie('wxyzm', rand_str)
    return response


if __name__ == '__main__':
    send_message_to_me()
