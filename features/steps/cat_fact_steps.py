import logging

from behave import *
from modules.utils import utils

logging.basicConfig(level=logging.INFO)


@given("the user wants to display a cat fact")
def step_impl(context):
    pass


@when("the user calls the cat fact APi endpoint")
def step_impl(context):
    cat_fact = utils.get_cat_fact()
    logging.info(f"Retrieved cat fact is {cat_fact}")
    print(f"Print Retrieved cat fact is {cat_fact}")
    context.feature.cat_fact = cat_fact


@then("a cat fact is returned")
def step_impl(context):
    assert len(context.feature.cat_fact["fact"]) == int(
        context.feature.cat_fact["length"]
    )
