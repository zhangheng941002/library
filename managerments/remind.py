while 1:
    import requests, json, time
    time.sleep(10)
    resp = requests.post("http://127.0.0.1:8000/managers/email_msg")
    print(json.loads(resp.content))
