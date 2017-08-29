Feature: Favourites
  As a registered user
  So that I can remember the properties I like
  I want to add them to my favourites

Scenario: Add to favourites
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  When I am on my last insertion page
  And I follow "Aggiungi ai preferiti"
  When I follow "Preferiti"
  Then I should see "Casa grande"
