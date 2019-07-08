Feature: Check Email

   As a logged user
   So that I can see my profile page
   I want to be able to see my email

   Scenario: Check email in profile page
    Given I am a logged in user
    When I am on the home page
      And I follow "test"
    Then I should see "test@lol.com"