Feature: Answer questions
  As a registered user
  So that I can give more info about a place
  I want to reply to users questions

Scenario: Give an answer
  Given I am a registered user
  When I log in
  And I create an insertion "Casa bella"
  When I am on my last insertion page
  And I fill in "question_body" with "Quanto è grande?"
  And I press "Invia"
  Then I should see "Dhug95"
  And I should see "Quanto è grande?"
  When I follow "Vedi risposte"
  Then I should see "Aggiungi una risposta"
  When I fill in "answer_body" with "Più grande"
  And I press "Invia"
  Then I should see "Risposte"
  And I should see "Più grande"
