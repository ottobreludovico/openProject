Feature: Fail Login

   As a guest user
   So that I can log in
   I want to be able to access with my credentials

   Scenario: Log into the system
    Given I am on the login page
      And I fill in "user_email" with "test@lol.com"
      And I fill in "user_password" with "lol.1234"
      And I press "Log in"
    Then I should see "Invalid Email or password."