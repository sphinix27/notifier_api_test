@all @functional
Feature: get templates with params name

  Scenario: create a new template
    Given I make a 'POST' request to '/templates' endpoint
    When I set the body as:
    """
    {
       "name": "My template at-04 ",
       "contentTemplate": "This should be at least 20 chars"
     }
    """
    When I execute the request to the endpoint
    Then I expect a '201' status code
    And I save the 'id' of 'templates'



  Scenario: Get template with params name
    Given I make a 'GET' request to '/templates' with:
      | name | My template at-04  |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "templates" with
    """
      {
        "description": null
      }
    """
    And The response body is the same as builded


  Scenario: Get template with params name and ignore case
    Given I make a 'GET' request to '/templates' with:
      | name       | My template at-04 |
      | ignoreCase | true              |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "templates" with
    """
      {
        "subjectTemplate": "Nueva Alerta. Severidad: [${Severity}]",
        "description": null
      }
    """
    And The response body is the same as builded

  @delete_channel
  Scenario: Get template with params name and ignore case
    Given I make a 'GET' request to '/templates' with:
      | name       | My template at-04     |
      | ignoreCase | false                 |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "templates" with
    """
      {
        "subjectTemplate": "Nueva Alerta. Severidad: [${Severity}]",
        "description": null
      }
    """
    And The response body is the same as builded
