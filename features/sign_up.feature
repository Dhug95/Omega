Feature: User can create a new account
  As a visitor
  So that the system remembers me
  I want to create a new account

Scenario: Go to sign up page
  Given I am on the home page
  When I follow "Registrati"
  Then I should be on the sign up page

Scenario: Create a new account
  Given I am on the sign up page
  When I fill in "Email" with "dabbraccio.francesco@gmail.com"
  And I fill in "Username" with "Dhug95"
  And I fill in "Password" with "123456"
  And I fill in "Password confirmation" with "123456"
  And I press "Sign up"
  Then I should be on the home page
  And I should see "Profilo"
  When I follow "Profilo"
  Then I should see "Dhug95"
  And I should see "dabbraccio.francesco@gmail.com"
