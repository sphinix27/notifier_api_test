@all @functional
Feature: Functional get for templates with ID

  Background: create a new template
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
    And I build the response for "template" with
    """
      {
        "subjectTemplate": null,
        "description": null
      }
    """
    And The response body is the same as builded

  @delete_templates
  Scenario: Delete template when I send an id with zeros by front
    Given I make a 'DELETE' request to '/templates/000$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I expect that the GET response it is empty

  @delete_templates
  Scenario: Get template when I send an id with zeros by front
    Given I make a 'GET' request to '/templates/000$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "template" with
    """
      {
        "subjectTemplate": null,
        "description": null
      }
    """
    And The response body is the same as builded

  @delete_templates
  Scenario: Put template when I send an id with zeros by front
    Given I make a 'PUT' request to '/templates/000$id' endpoint
    When I set the body as:
    """
   {
       "name": "new Template",
       "subjectTemplate": "subject of the template",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "template" with
    """
      {
        "description": null
      }
    """
    And The response body is the same as builded