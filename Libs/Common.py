from jsonschema import validate


def validate_json_with_schema(json, schema):
    validate(instance=json, schema=schema)
