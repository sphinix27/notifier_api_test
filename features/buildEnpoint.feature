Feature: bluid

  Scenario: enpoint
    Given value id: 15
    And I make a 'GET' request to '/channels/$id'
    And I make a 'POST' request to '/channels/$id' with paramethers:
      | type | slack |
      | name | email |
