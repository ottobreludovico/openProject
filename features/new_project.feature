Feature: New Project

   As a logged user
   So that I can access full home page
   I want to be able to create one project

   Scenario: I want to create one project
    Given I am on the home page as logged user
    When I follow "Create"
	   And I fill in "project_title" with "titolo"
       And I fill in "project_description" with "descrizione descrizione descrizione descrizione descrizione descrizione descrizione descrizione descrizione descrizione"
       And I fill in "project_number_of_member" with "3"
       And I press "Create Project"
    Then I should see "Project was successfully created."