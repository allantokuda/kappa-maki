Feature: Instance Variables

  Scenario: Ensure local steps execute and pass
    Given I have a local step
    Then local instance variables stay in the object scope

  Scenario: Ensure global steps execute and pass
    Given I have a global string step
    And I have a global regex step
    And I have another global regex step
    Then global instance variables stay in the World scope

  Scenario: Ensure local and global instance variables can co-exist
    Given I have a local step
    And I have a global string step
    Then local instance variables stay in the object scope
    And global instance variables stay in the World scope
