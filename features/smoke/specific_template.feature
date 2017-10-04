Feature:Specific Template

  Scenario: Get a specific Template
    Given I make a 'GET' request to '/templates/1' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code