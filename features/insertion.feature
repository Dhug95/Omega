Feature: Insertion
  As a lessor
  So that I can share my property
  I want to create an insertion

Scenario: Create insertion
  Given I am a registered user
  When I am on the login page
  And I fill in "Email" with "dabbraccio.francesco@gmail.com"
  And I fill in "Password" with "123456"
  And I press "Log in"
  Then I am on the home page

  When I follow "Mie inserzioni"
  And I follow "+ Crea inserzione +"
  And I fill in "Titolo" with "Casa grande"
  And I fill in "Descrizione" with "Molto grande"
  And I fill in "Prezzo" with "150"
  And I fill in "address_city" with "Rome, Italy"
  And I press "Save Property"
  Then I should see "Casa grande"
  And I should see "Molto grande"
  And I should see "150"
  And I should see "Rome, Italy"