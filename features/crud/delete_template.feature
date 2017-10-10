@all @crud
Feature: delete template

  Background:
  Scenario: create a new template
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
   {
       "name": "Template for delete",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'

  Scenario: delete a specific template
    Given I make a 'Delete' request to '/templates/$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I expect that the GET response it is empty