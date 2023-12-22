Feature: Submit orders

  Scenario Outline: Submit and retrieve Limit and Market orders
    Given the user has a valid API key
    When the user calls the API endpoint
    Then the details are returned and asserted

    @happy-path
    Examples: Submit Market Order
      | Action              | URL_Path_Param1                | URL_Path_Param2 | Payload_Data1      | Payload_Data2 | Payload_Data3   | Payload_Data4 | Payload_Data5        | Payload_Data6 | Payload_Data7 | Payload_Data8 | Payload_Data9 | Payload_Data10 | ResponseCode | ResponseCheck1         | ResponseCheck2        | ResponseCheck3          |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=10      | timeInForce=FOK | type=MARKET   | positionFill=DEFAULT |               |               |               |               |                | 201          | orderCreateTransaction | "type":"MARKET_ORDER" | "reason":"MARKET_ORDER" |

    @happy-path
    Examples: Submit Limit Order
      | Action             | URL_Path_Param1                | URL_Path_Param2 | Payload_Data1      | Payload_Data2 | Payload_Data3   | Payload_Data4 | Payload_Data5        | Payload_Data6 | Payload_Data7 | Payload_Data8 | Payload_Data9 | Payload_Data10 | ResponseCode | ResponseCheck1         | ResponseCheck2       | ResponseCheck3 |
      | SUBMIT_LIMIT_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=10      | timeInForce=GTC | type=LIMIT    | positionFill=DEFAULT | price=1.1     |               |               |               |                | 201          | orderCreateTransaction | "type":"LIMIT_ORDER" |                |

    @negative-tests
    Examples: Submit Market Order
      | Action              | URL_Path_Param1                | URL_Path_Param2 | Payload_Data1      | Payload_Data2 | Payload_Data3   | Payload_Data4 | Payload_Data5           | Payload_Data6 | Payload_Data7 | Payload_Data8 | Payload_Data9 | Payload_Data10 | ResponseCode | ResponseCheck1                                                   | ResponseCheck2 | ResponseCheck3 |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-102 |                 | instrument=GBP_USD | units=10      | timeInForce=FOK | type=MARKET   | positionFill=DEFAULT    |               |               |               |               |                | 403          | "errorMessage":"The provided request was forbidden."             |                |                |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-002 |                 | instrument=ABC_XYZ | units=10      | timeInForce=FOK | type=MARKET   | positionFill=DEFAULT    |               |               |               |               |                | 400          | "errorMessage":"Invalid value specified for 'order.instrument'"  |                |                |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=ABCD    | timeInForce=FOK | type=MARKET   | positionFill=DEFAULT    |               |               |               |               |                | 400          | "errorMessage":"Invalid value specified for 'order.units'"       |                |                |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=10      | timeInForce=JKK | type=MARKET   | positionFill=DEFAULT    |               |               |               |               |                | 400          | Invalid value specified for 'order.timeInForce'                  |                |                |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=10      | timeInForce=FOK | type=STOP     | positionFill=DEFAULT    |               |               |               |               |                | 400          | orderRejectTransaction                                           |                |                |
      | SUBMIT_MARKET_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=10      | timeInForce=FOK | type=MARKET   | positionFill=NONDEFAULT |               |               |               |               |                | 400          | "errorMessage":"Invalid value specified for 'orderPositionFill'" |                |                |

    @negative-tests
    Examples: Submit Limit Order
      | Action             | URL_Path_Param1                | URL_Path_Param2 | Payload_Data1      | Payload_Data2 | Payload_Data3   | Payload_Data4 | Payload_Data5        | Payload_Data6 | Payload_Data7 | Payload_Data8 | Payload_Data9 | Payload_Data10 | ResponseCode | ResponseCheck1         | ResponseCheck2       | ResponseCheck3 |
      | SUBMIT_LIMIT_ORDER | accountID=101-004-27768358-002 |                 | instrument=GBP_USD | units=10      | timeInForce=GTC | type=LIMIT    | positionFill=DEFAULT | price=1.1     |               |               |               |                | 201          | orderCreateTransaction | "type":"LIMIT_ORDER" |                |

    Examples: Get Orders for account
      | Action     | URL_Path_Param1                | URL_Path_Param2    | Payload_Data1 | Payload_Data2 | Payload_Data3 | Payload_Data4 | Payload_Data5 | Payload_Data6 | Payload_Data7 | Payload_Data8 | Payload_Data9 | Payload_Data10 | ResponseCode | ResponseCheck1    | ResponseCheck2 | ResponseCheck3 |
      | GET_ORDERS | accountID=101-004-27768358-002 | instrument=GBP_USD |               |               |               |               |               |               |               |               |               |                | 200          | CHECK: orders > 1 |                |                |

    Examples: Get Trades for account
      | Action     | URL_Path_Param1                | URL_Path_Param2 | Payload_Data1 | Payload_Data2 | Payload_Data3 | Payload_Data4 | Payload_Data5 | Payload_Data6 | Payload_Data7 | Payload_Data8 | Payload_Data9 | Payload_Data10 | ResponseCode | ResponseCheck1    | ResponseCheck2 | ResponseCheck3 |
      | GET_TRADES | accountID=101-004-27768358-002 |                 |               |               |               |               |               |               |               |               |               |                | 200          | CHECK: trades > 0 |                |                |


