import requests
import toml

#TODO: Move thee below to a config file later
CAT_FACT_API = "https://catfact.ninja/fact"
CONFIG_FILE = "/Users/muthupandianvadivelu/muthu/learn/oanda_api_behave_testing/config.toml"


def get_cat_fact():
    return requests.get(CAT_FACT_API).json()


def load_config(context):
    with open(CONFIG_FILE, "r") as f:
        config = toml.load(f)
    print(f"Config values are : {config}")
    context.hostname = config["host"]["hostname"]
    context.port = config["host"]["port"]
    context.token = config["token"]["token"]
    context.active_account = config["accounts"]["active_account"]