from behave import *
from modules.utils import utils


@given("the user has a valid API key")
def step_impl(context):
    pass


@when("the user calls the API endpoint")
def step_impl(context):
    api_end_point = utils.build_api_endpoint(context)
    print(f"Fully qualified end point is {api_end_point}")
    payload = utils.build_payload(context)
    print(f"Payload is  {payload}")
    response = utils.execute_action(
        context, api_end_point=api_end_point, payload=payload
    )
    print(f"Response is {response.text}")
    print(f"Response Code is {response.status_code}")
    context.response = response


@then("the details are returned and asserted")
def step_impl(context):
    utils.assert_response_code(context)
    utils.assert_response(context)
