Feature: Cool Calculator

  Scenario: Add two numbers
    Given I have entered two numbers into the calculator

    # THIS IS A DUPLICATE STEP ACROSS FEATURES!!
    When I press Add

    Then the result should be the sum of the two numbers
