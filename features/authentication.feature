Feature: Authentication feature

  Scenario: When i visit the home page
    Given I am on sign up page
    Then I should see "Sign in with Facebook"
    And I fill in "user[email]" with "a@b.com" within "body"
    And I fill in "user[password]" with "123456" within "body"
    And I fill in "user[password_confirmation]" with "123456" within "body"
    And I press "Sign up" within "body"
    Then I should see "Welcome! You have signed up successfully."
    
    
