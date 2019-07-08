Feature: Send Request Name

   As a logged user and project member
   So that I can see project's chat
   I want to be able to send messages

   Scenario: Send message in project's chat
    Given I am a logged in user
      And I am on the project chat page
      And I fill in "msg-body" with "test"
      And I press "Send"
      And I wait for "3" seconds
      And I reload the page
    Then I should see "lastname"