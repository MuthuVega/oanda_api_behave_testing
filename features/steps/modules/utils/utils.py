import json
import logging
import os

import requests
import toml
from features.steps.modules.utils import api_endpoints

# TODO: Move the below to a config file later
CAT_FACT_API = "https://catfact.ninja/fact"
CONFIG_FILE = (
    "/Users/muthupandianvadivelu/muthu/learn/oanda_api_behave_testing/config.toml"
)
CONFIG_FILE = "./config.toml"


def get_cat_fact():
    return requests.get(CAT_FACT_API).json()


def load_config(context):
    with open(CONFIG_FILE, "r") as f:
        config = toml.load(f)
    logging.info(f"Config values are : {config}")
    context.hostname = config["host"]["hostname"]
    context.port = config["host"]["port"]
    context.active_account = config["accounts"]["active_account"]
    context.token = os.environ.get("OANDA_DEMO_API_KEY")


def set_base_url(context):
    context.base_url = f"https://{context.hostname}:{context.port}"


def set_headers(context):
    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {context.token}",
    }
    context.headers = headers


def get_api_endpoint(context, api_endpoint):
    api_details = api_endpoints.get_end_point_details(api_endpoint)
    api_end_point = api_details["endpoint"]
    if api_details["params"]:
        for param in api_details["params"]:
            if param == "accountID":
                api_end_point = api_end_point.format(accountID=context.active_account)
            elif param == "transactionID":
                api_end_point = api_end_point.format(transactionID=5)
    api_end_point = f"{context.base_url}{api_end_point}"
    return api_end_point


def execute_action(context, api_end_point, payload=None):
    if payload:
        response = requests.post(
            url=api_end_point, json=payload, headers=context.headers
        )
    else:
        response = requests.get(url=api_end_point, headers=context.headers)
    return response


def get_data(context, api_end_point):
    response = requests.get(url=api_end_point, headers=context.headers)
    print(json.dumps(response.json(), indent=2))
    print(f"Response code is {response.status_code}")
    return response


def build_api_endpoint(context):
    print(f"Action is {context.active_outline['Action']}")
    api_details = api_endpoints.get_end_point_details(context.active_outline["Action"])
    api_end_point = api_details["endpoint"]
    param = {}
    for row_heading in context.active_outline.headings:
        if row_heading.find("URL_Path_Param") != -1:
            if context.active_outline[row_heading] != "":
                url_param, value = context.active_outline[row_heading].split("=")
                param[url_param] = value
                api_end_point = api_end_point.format(**param)

    api_end_point = f"{context.base_url}{api_end_point}"
    return api_end_point


def build_payload(context):
    api_details = api_endpoints.get_end_point_details(context.active_outline["Action"])
    if api_details["type"] != "GET":
        payload_object = api_details["payload_object"][0]
        payload = {}
        for row_heading in context.active_outline.headings:
            if row_heading.find("Payload") != -1:
                if context.active_outline[row_heading] != "":
                    key, value = context.active_outline[row_heading].split("=")
                    payload[key] = value
        if payload != {}:
            return {payload_object: payload}


def assert_response_code(context):
    if context.active_outline["ResponseCode"] != "":
        assert context.response.status_code == int(
            context.active_outline["ResponseCode"]
        )


def assert_response(context):
    for row_heading in context.active_outline.headings:
        if row_heading.find("ResponseCheck") != -1:
            if context.active_outline[row_heading] != "":
                if "CHECK:" in context.active_outline[row_heading]:
                    item_to_check = context.active_outline[row_heading].split(" ")
                    exec(
                        f"{item_to_check[1]} = {len(context.response.json()[item_to_check[1]])}"
                    )
                    item_to_check = context.active_outline[row_heading].split(": ")
                    assert eval(item_to_check[1])
                else:
                    assert context.active_outline[row_heading] in str(
                        context.response.text
                    )
