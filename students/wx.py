import requests, json
import random
import itchat

itchat.auto_login(hotReload=True)


def send_message_to_me():
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
    # resp = requests.post(url=URL_ALL_SEND, data=data)
    # resp = json.loads(resp.content)
    # # print(resp)
    # if resp.get("code") == 0:
    #     print(resp.get("data"))
    #     return {"status": 1, "wxyzm": rand_str}
    # else:
    #     return {"status": 0, "msg": "发送验证码失败"}

    # response = JsonResponse({'st': rand_str})
    # response.set_cookie('wxyzm', rand_str)
    # return response

    users = itchat.search_friends(name='张衡')  # 使用备注名来查找实际用户名
    # 获取好友全部信息,返回一个列表,列表内是一个字典
    print(users)
    # 获取`UserName`,用于发送消息
    userName = users[0]['UserName']
    itchat.send("学习的验证码为：{}".format(rand_str), toUserName=userName)
    return {"status": 1, "wxyzm": rand_str}


if __name__ == '__main__':
    send_message_to_me()
