Feature: Open Tv Prog
    App should launch

    Scenario: Open the App
        Given I open Tv Prog
        When I wait for 5 second
        Then I should see TNT programs