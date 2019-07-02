Feature: Edit User

   As a logged user
   So that I can access my edit page
   I want to be able to update my profile

   Scenario: I want to edit my profile
    Given I am a logged in user
    When I am on the home page
	    And I follow "test"
	    And I press "Edit Profile"
	    And I fill in "user_first_name" with "Test 2"
	    And I press "Update"
    Then I should see "successfully"