Feature: User can set an avatar
  As a registered user
  So that I can show an image representing me
  I want to set an avatar

Scenario: Go to sign up page
  Given I am on the home page
  When I follow "Registrati"
  Then I should be on the sign up page

Scenario: Add an avatar
  Given I am on the sign up page
  When I fill in "Email" with "dabbraccio.francesco@gmail.com"
  And I fill in "Username" with "Dhug95"
  And I fill in "Password" with "123456"
  And I fill in "Password confirmation" with "123456"
  And I attach the file "/Users/Francesco/Pictures/Napoli/2017-07-30 00.32.27.jpg" to "Avatar"
  And I press "Sign up"
  Then I should be on the home page
  And I should see "Profilo"
  When I follow "Profilo"
  Then I should see "Dhug95"
  And I should see "dabbraccio.francesco@gmail.com"
  And I should see the image
