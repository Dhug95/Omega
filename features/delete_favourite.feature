Feature: Delete favourite
  As a registered user
  So that I can no longer have updates about a property
  I want to delete it from my favourites

Scenario: Delete a property from list
  Given I am a registered user
  When I log in
  And I create an insertion "Mondial casa"
  When I am on my last insertion page
  And I follow "Aggiungi ai preferiti"
  When I follow "Preferiti"
  Then I should see "Mondial casa"
  When I am on my last insertion page
  And I follow "Rimuovi dai preferiti"
  When I follow "Preferiti"
  Then I should not see "Mondial casa"
