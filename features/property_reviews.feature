Feature: Property Reviews
  As a lessee
  So that I can share my opinion about a property
  I want to write a review

Scenario: Leave a review
  Given I am a registered user
  When I log in
  And I create an insertion "Casa grande"
  When I go to my last insertion page
  And I fill in "Title" with "Molto bella"
  And I fill in "Body" with "Ne vale la pena"
  And I press "Invia recensione"
  Then I should see "Molto bella"
  And I should see "Ne vale la pena"
