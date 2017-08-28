Feature: Property Ratings
  As a lessee
  So that I can give a numerical rate of a property
  I want to give a rate out of 10

Scenario: Add a valuation
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  When I go to my last insertion page
  And I fill in "Title" with "Molto bella"
  And I fill in "Body" with "Ne vale la pena"
  And I select "9" from "review[valutation]"
  And I press "Invia recensione"
  Then I should see "Molto bella"
  And I should see "Ne vale la pena"
  And I should see "9"
