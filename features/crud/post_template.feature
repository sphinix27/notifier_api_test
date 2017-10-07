@all @crud
Feature: template

  Scenario: create a new template
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
   {
       "name": "Template test12",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'
    And I capture the response to the endpoint
    Given I make a 'GET' request to '/templates/$id' endpoint
    And I execute the request to the endpoint
    Then I expect POST response is the same as GET response



