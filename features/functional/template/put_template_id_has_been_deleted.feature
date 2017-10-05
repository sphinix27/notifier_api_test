Feature: Functional put for templates with ID

  Background: create a new template
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
   {
       "name": "New Template",
       "contentTemplate": "This template has been created."
     }
    """
    When I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'
    Given I make a 'Delete' request to '/templates/$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code

  Scenario: Send a new template with the same name
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
   {
       "name": "New Template",
       "contentTemplate": "This template has been created."
     }
    """
    When I execute the request to the endpoint
    Then I expect a '404' status code
