Feature: Open old interface
    Old interface should be accessible

    Scenario: Old interface
        Given I open Tv Prog
        When I show the old interface
        Then I should see TNT programs