Feature: Edit account
  As a registered user
  So that I can change the info about me
  I want to edit my account

Scenario: Edit account
  Given I am a registered user
  When I am on the login page
  And I fill in "Email" with "dabbraccio.francesco@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log in"
  Then I am on the home page

  When I follow "Profilo"
  And I follow "Modifica info"
  And I fill in "Username" with "CarmineMariaMansueto95.dragonball"
  And I fill in "Current password" with "123456"
  And I press "Update"
  Then I am on the home page
  When I follow "Profilo"
  Then I should see "CarmineMariaMansueto95.dragonball"
