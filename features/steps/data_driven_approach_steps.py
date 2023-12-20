from behave import *
from modules.utils import utils


@given(u'the user has a valid API key')
def step_impl(context):
    pass


@when(u'the user calls the API endpoint')
def step_impl(context):
    api_end_point = utils.build_api_endpoint(context)
    print(f"Fully qualified end point is {api_end_point}")
    response = utils.get_data(context, api_end_point=api_end_point)
    context.response = response


@then(u'the details are returned and asserted')
def step_impl(context):
    utils.assert_response_code(context)
    utils.assert_response(context)
