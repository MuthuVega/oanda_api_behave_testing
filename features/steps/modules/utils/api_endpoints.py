"""
Module to store API endpoint details
"""

OANDA_API_ENDPOINTS = {
    "GET_ACCOUNTS": {"endpoint": "/v3/accounts", "type": "GET", "params": None},
    "GET_ACCOUNT_DETAILS": {
        "endpoint": "/v3/accounts/{accountID}",
        "type": "GET",
        "params": ["accountID"],
    },
    "GET_ACCOUNT_SUMMARY": {
        "endpoint": "/v3/accounts/{accountID}/summary",
        "type": "GET",
        "params": ["accountID"],
    },
    "GET_ACCOUNT_INSTRUMENTS": {
        "endpoint": "/v3/accounts/{accountID}/instruments",
        "type": "GET",
        "params": ["accountID"],
    },
    "GET_ACCOUNT_CHANGES": {
        "endpoint": "/v3/accounts/{accountID}/changes?sinceTransactionID={{transactionID}}",
        "type": "GET",
        "params": ["accountID", "transactionID"],
    },
    "GET_ORDER_BOOK": {
        "endpoint": "/v3/instruments/{instrument}/orderBook",
        "type": "GET",
        "params": ["instrument"],
    },
    "GET_POSITION_BOOK": {
        "endpoint": "/v3/instruments/{instrument}/positionBook",
        "type": "GET",
        "params": ["instrument"],
    },
    "SUBMIT_MARKET_ORDER": {
        "endpoint": "/v3/accounts/{accountID}/orders",
        "type": "POST",
        "params": ["accountID"],
        "payload_object": ["order"],
    },
    "SUBMIT_LIMIT_ORDER": {
        "endpoint": "/v3/accounts/{accountID}/orders",
        "type": "POST",
        "params": ["accountID"],
        "payload_object": ["order"],
    },
    "GET_ORDERS": {
        "endpoint": "/v3/accounts/{accountID}/orders?instrument={{instrument}}",
        "type": "GET",
        "params": ["accountID"],
    },
    "GET_TRADES": {
        "endpoint": "/v3/accounts/{accountID}/openTrades",
        "type": "GET",
        "params": ["accountID"],
    },
}


def get_end_point_details(end_point_name):
    return OANDA_API_ENDPOINTS[end_point_name]
