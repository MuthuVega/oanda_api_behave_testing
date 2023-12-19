import logging
from steps.modules.utils import utils


def before_all(context):
    utils.load_config(context)
    print(f"Loaded context {context}")
