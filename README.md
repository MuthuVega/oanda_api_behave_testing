# Behave framework to test OANDA v20 API

Test framework built using behave and python to test OANDA v20 REST API endpoints.

This is a sample BDD framework built to demonstrate how to create a custom framework to test REST API endpoints.
This framework leverages both the traditional BDD style and the data driven style for maximum coverage and ease of creating new tests.
Also, the framework has been developed to be flexible to add additional API endpoints and the results assertions as configurable items.

The tests are run on GitHub actions and the test results uploaded as test artifacts.

## Requirements

Install the pre-requisites using the below:

`pip install -r requirements.txt`

## Notes

You will need your own OANDA demo API key to run these tests.

Create an environment variable named `OANDA_DEMO_API_KEY` and store the API key to run the tests locally.

## Run tests

`behave -s -v --no-capture`