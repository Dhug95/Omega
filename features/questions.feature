Feature: Questions
  As a registered user
  So that I can be sure about something
  I want to make a question on a place’s page

Scenario: Make a question
  Given I am a registered user
  When I log in
  And I create an insertion "Casa bella"
  When I am on my last insertion page
  And I fill in "question_body" with "Quanto è grande?"
  And I press "Invia"
  Then I should see "Dhug95"
  And I should see "Quanto è grande?"
