Feature: Order and position books

  Scenario Outline: Get order and position books for account
    Given the user has a valid API key
    When the user calls the API endpoint
    Then the details are returned and asserted

    @happy-path
    Examples: Retrieve existing order book for valid instrument
      | Action         | URL_Path_Param1    | URL_Path_Param2 | URL_Query_Param1 | URL_Query_Param2 | ResponseCode | ResponseCheck1 | ResponseCheck2 | ResponseCheck3 |
      | GET_ORDER_BOOK | instrument=GBP_USD |                 |                  |                  | 200          |                |                |                |
      | GET_ORDER_BOOK | instrument=USD_CAD |                 |                  |                  | 200          |                |                |                |

    @negative-tests
    Examples: Retrieve order book for invalid instrument
      | Action         | URL_Path_Param1    | URL_Path_Param2 | URL_Query_Param1 | URL_Query_Param2 | ResponseCode | ResponseCheck1                                                            | ResponseCheck2 | ResponseCheck3 |
      | GET_ORDER_BOOK | instrument=ABC_USD |                 |                  |                  | 400          | "errorMessage":"ABC_USD is not a valid instrument."                       |                |                |
      | GET_ORDER_BOOK | instrument=1234    |                 |                  |                  | 400          | 1234 is not a valid instrument.                                           |                |                |
      | GET_ORDER_BOOK | instrument=GBP/USD |                 |                  |                  | 404          | "errorMessage":"Unrecognized endpoint: /v3/instruments/GBP/USD/orderBook" |                |                |
      | GET_ORDER_BOOK | instrument=GOLD    |                 |                  |                  | 400          | GOLD is not a valid instrument.                                           |                |                |

    @happy-path
    Examples: Retrieve existing position book for valid instrument
      | Action            | URL_Path_Param1    | URL_Path_Param2 | URL_Query_Param1 | URL_Query_Param2 | ResponseCode | ResponseCheck1 | ResponseCheck2 | ResponseCheck3 |
      | GET_POSITION_BOOK | instrument=GBP_USD |                 |                  |                  | 200          |                |                |                |
      | GET_POSITION_BOOK | instrument=USD_CAD |                 |                  |                  | 200          |                |                |                |

    @negative-tests
    Examples: Retrieve position book for invalid instrument
      | Action            | URL_Path_Param1    | URL_Path_Param2 | URL_Query_Param1 | URL_Query_Param2 | ResponseCode | ResponseCheck1                                                               | ResponseCheck2 | ResponseCheck3 |
      | GET_POSITION_BOOK | instrument=ABC_USD |                 |                  |                  | 400          | "errorMessage":"ABC_USD is not a valid instrument."                          |                |                |
      | GET_POSITION_BOOK | instrument=1234    |                 |                  |                  | 400          | 1234 is not a valid instrument.                                              |                |                |
      | GET_POSITION_BOOK | instrument=GBP/USD |                 |                  |                  | 404          | "errorMessage":"Unrecognized endpoint: /v3/instruments/GBP/USD/positionBook" |                |                |
      | GET_POSITION_BOOK | instrument=GOLD    |                 |                  |                  | 400          | GOLD is not a valid instrument.                                              |                |                |
