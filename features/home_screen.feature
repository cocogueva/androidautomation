@home_screen
Feature: Tests for Home screen functionality

  Background:
    Given I land on Home screen

  @default
  Scenario: Default values on Home screen is Foot and Centimeter
    Then Left Unit picker value should be "Foot"
    And Right unit picker value should be "Centimeter"

  Scenario: Show All button should be enabled at launch
    Given I land on Home screen
    Then Show All button should be disabled
    When I type "1" on application keyboard
    Then Show All button should be enabled

  @conversions
  Scenario Outline: Verify default conversion
    When I type "<target>" on application keyboard
    Then I should see result as "<result>"
    Examples:
      | target | result    |
      | 1      | 30.48     |
      | 2      | 60.96     |
      | 3      | 91.44     |
      | 9      | 274.32    |
      | 1011   | 30 815.28 |


  Scenario: User able to search by existing Conversion Type
    Then I press on search icon
    Then I type "Temperatura" in search field
    And I press return button on soft keyboard
    Then I see "Temperatura" as current unit converter
    Then Left Unit picker value should be "Celsius"
    Then Right unit picker value should be "Fahrenheit"

  Scenario Outline: User able to select values from unit pickers
    Then I select "<unit_type>" from left unit picker
    When I type "<amount>" on application keyboard
    Then I should see result as "<result>"

    Examples:
      | unit_type | amount | result  |
      | Pulgada   | 1      | 2.54    |
      | Link1     | 1      | 20.1168 |

  Scenario: User able to convert values
    When I press on Menu icon
    Then I select "Volumen" from menu
    Then I select "Taza" from right unit picker
    When I type "1" on application keyboard
    Then I should see result as "15.1416"

  Scenario: User is able to switch values
    Then Left Unit picker value should be "Pie"
    And Right unit picker value should be "Centimetro"
    When I press on switch unit button
    Then Left Unit picker value should be "Centimetro"
    And Right unit picker value should be "Pie"

  @wip
  Scenario: User able to cleanup conversion history
    When I press on Menu icon
    Then I select "Historial" from menu
    Then I see "Historial" as current unit converter
    Then I should see text "Vaciar aquí en este momento"
    When I press on Menu icon
    Then I select "Longitud" from menu
    When I type "1" on application keyboard
    When I press on Menu icon
    Then I select "Historial" from menu
    And I verify that 1st result in history is "Longitud"
    When I press delete from history at 1st row
    Then I should see text "Vaciar aquí en este momento"