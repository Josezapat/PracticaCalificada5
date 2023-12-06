 Scenario: restrict to movies with PG or R ratings
  Given I am on the RottenPotatoes home page
  When I check the "PG" checkbox
  And I check the "R" checkbox
  And I press "Refresh Page"
  Then I should see only movies with ratings: PG, R
  And I should not see movies with other ratings
