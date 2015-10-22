Feature: Marvellous Messager

  Scenario: Send a message
    Given I have initiated a messaging session with a friend
    When I enter a message
    And press Send
    Then my friend receives the message

  Scenario: Add a friend
    Given I have initiated a messaging session
    And something standard is set up in mode 5
    And I am viewing the Add Friend dialog
    When I enter the username of my friend

    # THIS IS A DUPLICATE STEP ACROSS FEATURES!
    And I press Add

    Then my friend receives an invitation to exchange messages

