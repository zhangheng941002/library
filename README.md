图书馆占座系统

﻿1、安装依赖包

    pip install -r requirments.txt

2、生成迁移文件

    python manage.py makemigrations 

3、执行迁移文件

    python manage.py migrate

4、启动项目

    python manager.py runserver 

5、创建管理员账号

    python manage.py createsuperuser

6、邮件提醒，windows下启动remind.py文件即可，linux下建议使用crontab命令

    crontab 命令介绍
    1、 crontab -e 进入 crontab 命令管理页面
    2、 命令组成   时间 + 执行命令
       时间的组成为 * * * * *　一次对应　分钟　小时　几号　月份　星期几
       执行命令：需要用到绝对路径

７、确认到场验证码使用微信发送通知

    因为是使用个人微信充当转发中心，所以需要发送的名称为你微信的备注名称，改善措施如下：
    １、使用公众号发送
    ２、注册账号与微信号关联，通过登录信息找微信，之后发送验证码

８、涉及的东西

    数据库：mysql
    框架：django
    页面：h5,css,js,
    发送邮件
    微信接入
