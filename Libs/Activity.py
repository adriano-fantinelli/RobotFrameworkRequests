import requests
import json


def post_activity():
    header_info = {"accept": "text/plain; v=1.0", "Content-Type": "application/json; v=1.0"}
    payload = {"id": "0", "title": "Test", "dueDate": "2023-06-24T22:53:53.978Z", "completed": True}
    r = requests.post("https://fakerestapi.azurewebsites.net/api/v1/Activities", headers=header_info, json=payload)
    return r