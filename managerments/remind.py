while 1:
    import requests, json

    resp = requests.post("http://192.168.178.200:9969/managers/email_msg")
    print(json.loads(resp.content))
