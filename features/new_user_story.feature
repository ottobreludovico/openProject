Feature: New User story

   As a logged user
   So that I can create a project
   I want to be able to add new user story

   Scenario: I want to create a new user story
    Given I am on my project page
    When I follow "User Stories"
	    And I fill in "titolo" with "titolo"
       And I fill in "descrizione" with "descrizione"
       And I press "InserisciUS"
    Then I should see "{{card.title}}"