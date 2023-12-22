Feature: OANDA Account details

@happy-path
Scenario: Get accounts
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNTS" API endpoint
    Then the account details are returned

@happy-path
Scenario: Get account details
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_DETAILS" API endpoint
    Then the account details are returned

@happy-path
Scenario: Get account summary
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_SUMMARY" API endpoint
    Then the account details are returned

Scenario: Get account instruments
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_INSTRUMENTS" API endpoint
    Then the account details are returned

@happy-path
Scenario: Get account changes
    Given the user has a valid API token
    When the user calls the "GET_ACCOUNT_CHANGES" API endpoint
    Then the account details are returned

@negative-tests
Scenario: Get account details for invalid account
    Given the user has a valid API token
    And account number is "100-200-300-400"
    When the user calls the "GET_ACCOUNT_DETAILS" API endpoint
    Then an error is returned with response code "403"

@negative-tests
Scenario: Get account summary for invalid account
    Given the user has a valid API token
    And account number is "ABCD"
    When the user calls the "GET_ACCOUNT_SUMMARY" API endpoint
    Then an error is returned with response code "400"

@negative-tests
Scenario: Get account instruments for invalid account
    Given the user has a valid API token
    And account number is "ACC NUM"
    When the user calls the "GET_ACCOUNT_INSTRUMENTS" API endpoint
    Then an error is returned with response code "400"

@negative-tests
Scenario: Get account changes for invalid account
    Given the user has a valid API token
    And account number is "234562834569"
    When the user calls the "GET_ACCOUNT_CHANGES" API endpoint
    Then an error is returned with response code "400"