from django.shortcuts import render, redirect
from django.http import JsonResponse

from students.models import User


# 首页
def shouye(request):
    return render(request, 'shouye.html')


# 搜索
def sousuo(request):
    uid = request.session.get('id')
    if uid:
        # 如果登陆渲染登陆模版
        return render(request, 'sousuo_denglu.html')
    else:
        # 如果没有uid 说明没有登陆，渲染未登录的模版
        return render(request, 'sousuo_nodl.html')


# 生成验证码
def yanzhengma(request):
    import random
    # 定义验证码的备选值
    str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0qwertyuiopasdfghjklzxcvbnm'
    # 随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    response = JsonResponse({'st': rand_str})
    response.set_cookie('yzm', rand_str)
    return response


# 登陆
def login(request):
    # 设置关闭浏览器 session 就失效，即关闭浏览器，不管用户是否推出都推出登陆
    request.session.set_expiry(0)

    if request.method == "GET":
        return render(request, 'user/login.html')
    # form 表单post请求过来的

    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        yzm = request.POST.get('yzm')
        yzm_sc = request.COOKIES.get('yzm')
        # 判定验证码是否输入正确
        if yzm.lower() == yzm_sc.lower():

            # 通过获得的username 和 password 跟数据库进行匹配
            if User.objects.filter(username=username, password=password):
                # 验证通过，转到个人中心,并保存session,用于验证用户是否登陆
                request.session['username'] = username
                username = request.session.get('username')
                user = User.objects.get(username=username)
                uid = user.id
                request.session['id'] = uid
                put_url = request.COOKIES.get('url')

                return render(request, 'shouye_dl.html')
                # return render(request, 'shouye.html', {'se': request.session['id']})

            else:
                # 验证不通过，重新渲染登陆页面
                if not User.objects.filter(username=username):
                    # 密码错误
                    return render(request, 'user/login.html', {'ps': "用户名或密码不正确", 'un': username})
        else:
            return render(request, 'user/login.html', {'yzmcw': "验证码不正确", 'un': username})


# from django.contrib.auth import logout, login
# 退出登陆
def logout(request):
    request.session.flush()

    # logout(request)
    return redirect(shouye)
