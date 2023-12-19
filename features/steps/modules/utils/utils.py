import json
import logging

import requests
import toml
from features.steps.modules.utils import api_endpoints

# TODO: Move thee below to a config file later
CAT_FACT_API = "https://catfact.ninja/fact"
CONFIG_FILE = "/Users/muthupandianvadivelu/muthu/learn/oanda_api_behave_testing/config.toml"


def get_cat_fact():
    return requests.get(CAT_FACT_API).json()


def load_config(context):
    with open(CONFIG_FILE, "r") as f:
        config = toml.load(f)
    logging.info(f"Config values are : {config}")
    context.hostname = config["host"]["hostname"]
    context.port = config["host"]["port"]
    context.token = config["token"]["token"]
    context.active_account = config["accounts"]["active_account"]


def set_base_url(context):
    context.base_url = f"https://{context.hostname}:{context.port}"


def set_headers(context):
    headers = {"Content-Type": "application/json", "Authorization": f"Bearer {context.token}"}
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


def get_data(context, api_end_point):
    response = requests.get(url=api_end_point, headers=context.headers)
    print(json.dumps(response.json(), indent=2))
    return response
