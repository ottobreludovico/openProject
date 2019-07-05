Feature: Set Deadline User story

   As a teamleader
   So that I can access my project page
   I want to be able to set a deadline of a user story

   Scenario: I want to set a deadline a user story
    Given I am on my project page with 1 user story
    When I follow "User Stories"
       And I fill in "deadline" with "2020-10-10"
       And I press "Inserisci"
       And I reload my project page
       And I follow "User Stories"
    Then I should see "{{card.deadline}}"