import logging
from steps.modules.utils import utils


def before_all(context):
    utils.load_config(context)
    utils.set_base_url(context)
    utils.set_headers(context)
    logging.info(f"Vale loaded into context is {context}")

