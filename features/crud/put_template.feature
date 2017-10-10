@all @crud
Feature: template

  Background:
  Scenario: create a new template
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
   {
       "name": "Template for update",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'

  Scenario: create a new template
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
   {
       "name": "new Template",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I capture the response to the endpoint
    Given I make a 'GET' request to '/templates/$id' endpoint
    Then I expect PUT response is the same as GET response


