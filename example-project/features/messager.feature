@enforce_local_steps

Feature: Messager

  Scenario: Send a message
    Given I have initiated a messaging session with a friend
    When I enter a message
    And press Send
    Then my friend receives the message

  Scenario: Add a friend
    Given I have initiated a messaging session
    And I am viewing the Add Friend dialog
    When I enter the username of my friend

    # THIS IS A DUPLICATE STEP ACROSS FEATURES!
    And I press Add

    Then my friend receives an invitation to exchange messages

