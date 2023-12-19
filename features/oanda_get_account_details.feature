Feature: OANDA Account details

Scenario: Get accounts
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNTS" API endpoint
    Then the account details are returned

Scenario: Get account details
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_DETAILS" API endpoint
    Then the account details are returned

Scenario: Get account summary
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_SUMMARY" API endpoint
    Then the account details are returned

Scenario: Get account instruments
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_INSTRUMENTS" API endpoint
    Then the account details are returned

Scenario: Get account changes
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_CHANGES" API endpoint
    Then the account details are returned