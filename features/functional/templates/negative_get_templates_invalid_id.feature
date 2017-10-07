@functional @all
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
  Scenario Outline: Send a new template
    Given I make a 'GET' request to '/templates/<id>' endpoint
    When I execute the request to the endpoint
    Then I expect a '<status_code>' status code

    Examples:
      | id     | status_code | description                    |
      | DIKJAS   | 400         | Send an invalid id (letters)            |
      | asd13asd | 400         | Send an invalid id (letters and number) |
      | 1        | 404         | Send a non-exist id                     |
      |          | 200         | Send an empty id                        |
      | -3       | 404         | Send an id less or equals to 0          |
      | 0        | 404         | Send an id 0                            |

