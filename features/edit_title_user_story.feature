Feature: Edit Title User story

   As a teamleader
   So that I can access my project page
   I want to be able to edit the title of a user story

   Scenario: I want to edit a user story
    Given I am on my project page with 1 user story
    When I am on the user_stories page
	    And I follow "Edit"
       And I fill in "Title" with "Titolo2"
       And I click Update User Story
       And I am on the user_stories page
    Then I should see "Titolo2"