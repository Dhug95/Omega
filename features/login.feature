Feature: User can login to the system
  As a registered user
  So that I can interact with the system
  I want to log in the system

Scenario: Go to login page
  Given I am a registered user
  And I am on the home page
  When I follow "Accedi"
  Then I should be on the login page
  When I fill in "Email" with "dabbraccio.francesco@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log in"
  Then I should be on the home page
  And I should see "Esci"
