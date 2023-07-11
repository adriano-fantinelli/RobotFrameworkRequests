import json
import requests
import sys
sys.path.append("Devdata")
import Env


def post_activity(headers, id, title, due_data, completed):
    payload = {"id": id, "title": title, "dueDate": due_data, "completed": completed}
    r = requests.post(Env.base_url + Env.activities_path, headers=headers, json=payload)
    return r
