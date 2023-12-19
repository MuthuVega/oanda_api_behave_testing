import logging

from behave import *
from modules.utils import utils


@given(u'the user has a valid API token')
def step_impl(context):
    pass


@when(u'the user calls the "{api_endpoint}" API endpoint')
def step_impl(context, api_endpoint):
    print(f"The text is {api_endpoint}")
    api_end_point = utils.get_api_endpoint(context, api_endpoint=api_endpoint)
    print(f"Fully qualified end point is {api_end_point}")
    response = utils.get_data(context, api_end_point=api_end_point)
    context.response = response


@then(u'the account details are returned')
def step_impl(context):
    assert context.response.ok
    assert context.response.status_code == 200
    assert len(context.response.json()) > 0

