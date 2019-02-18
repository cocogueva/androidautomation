@custom_conversions
Feature: User Able to create and manage custom conversions

  Scenario: User able to create new conversion
    Given I land on Home screen
    Then I press on Menu icon
    Then I press on My conversions button
    Then I press on Create your first conversion button
    And I type "Power" as custom conversion name
    When I press o New unit button
    Then I type "Horse Power" as unit name
    Then I type "HP" as unit symbol
    Then I type "1" as unit value
    #Adding a 2nd Unit to the
    When I press o New unit button
    Then I type "Mule Power" as unit name
    Then I type "MP" as unit symbol
    Then I type "0.5" as unit value
    Then I press submit checkmark on Custom conversions screen

    Then I verify "Power" added to custom conversions list


