Feature: Logout User

   As a guest user
   So that I can log in
   I want to be able to logout

   Scenario: Log into the system
    Given I am on the login page
      And I fill in "user_email" with "test@lol.com"
      And I fill in "user_password" with "lol.123"
      And I press "Log in"
      And I follow "logout"
    Then I should see "Signed out successfully."