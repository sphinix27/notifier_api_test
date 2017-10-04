Feature: get templates

  Scenario: Get all templates
    Given I make a 'GET' request to '/templates' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I expect that the GET response it is empty