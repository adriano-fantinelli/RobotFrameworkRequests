import requests
from Devdata import Env

def post_activity(headers, id, title, dueData, completed):
    header_info = {"accept": "text/plain; v=1.0", "Content-Type": "application/json; v=1.0"}
    payload = {"id": id, "title": title, "dueDate": dueData, "completed": completed}
    r = requests.post(Env.base_url + Env.activities_path, headers=headers, json=payload)
    return r
