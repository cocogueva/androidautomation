@gestures
Feature: User able to use gestures

    Scenario: User able to swipe to open lef side menu
        Given I land on Home screen
        When I swipe from left to right
        Then I should see left side menu
        Then I swipe from right to left
        Then I see "Longitud" as current unit converter

    Scenario: User able to swipe to open calculator
        Given I land on Home screen
        Then I swipe from rightest to left
        Then I see "Calculadora" as current unit converter
        When I swipe from left.2 to right
        Then I see "Longitud" as current unit converter