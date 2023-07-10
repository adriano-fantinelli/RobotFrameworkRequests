activitySchema = {
    "type": "object",
    "properties": {
        "id": {"type": "number"},
        "title": {"type": "string"},
        "dueDate": {"type": "string"},
        "completed": {"type": "boolean"}
    },
    "required": ["id", "title", "dueDate", "completed"]
}