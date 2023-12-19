Feature: Sample first feature

Scenario: Get cat fact
    Given the user wants to display a cat fact
    When the user calls the cat fact APi endpoint
    Then a cat fact is returned