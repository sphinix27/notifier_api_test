@all @crud
Feature: get specific template

  Background:
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
   {
       "name": "Template 1",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'
    And I capture the response to the endpoint


  Scenario: Get a specific template
    Given I make a 'GET' request to '/templates/$id' endpoint
    When I execute the request to the endpoint
    Then I expect POST response is the same as GET response


