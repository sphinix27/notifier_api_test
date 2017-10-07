@functional @all
Feature: Functional put for notification with several name param

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
    And I build the response for "template" with
    """
      {
        "subjectTemplate": null,
        "description": null
      }
    """
    And The response body is the same as builded

  @delete_templates
  Scenario Outline: send several case for the param
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
     {
        "name": "<name>",
        "subjectTemplate": "<subject>",
        "contentTemplate": "<content>",
        "description": "<description>"

     }
    """
    When I execute the request to the endpoint
    Then  I expect a '<status>' status code


    Examples:
      | name          | subject                        | content                        | description          | status |
#      | send more 256? | subject is valid for this case | subject is valid for this case | description is valid | 400    |
      | Test @#!@# 12 | subject is valid for this case | content is valid for this case | description is valid | 200    |
      | Tes           | subject is valid for this case | content is valid for this case | description is valid | 400    |
      |               | subject is valid for this case | content is valid for this case | description is valid | 400    |
#      | Valid name     | send more 256?                 | content is valid for this case | description is valid | 400    |
      | Valid name    | Test invalid !@#!3 123 @$#123  | content is valid for this case | description is valid | 200    |
      | Valid name    |                                | content is valid for this case | description is valid | 400    |
#      | Valid name     | subject is valid for this case | send more 2147483647           | description is valid | 400    |
      | Valid name    | subject is valid for this case | less 20 characters             | description is valid | 400    |
      | Valid name    | subject is valid for this case |                                | description is valid | 400    |
      | Valid name    | subject is valid for this case | content is valid for this case |                      | 200    |
      | Valid name    | subject is valid for this case | content is valid for this case | description is valid | 200    |

  @delete_templates
  Scenario: send without param name
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
     {
        "subjectTemplate": "subject is valid for this case",
        "contentTemplate": "content is valid for this case",
        "description": "description is valid"
     }
    """
    When I execute the request to the endpoint
    Then  I expect a '400' status code

  @delete_templates
  Scenario: send without param subject
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
     {
        "name": "test template",
        "contentTemplate": "content is valid for this case",
        "description": "description is valid"
     }
    """
    When I execute the request to the endpoint
    Then  I expect a '200' status code
    And I build the response for "template" with
    """
      {
        "subjectTemplate": null
      }
    """
    And The response body is the same as builded

  @delete_templates
  Scenario: send without param content
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
     {
        "name": "test template",
        "subjectTemplate": "subject is valid for this case",
        "description": "description is valid"
     }
    """
    When I execute the request to the endpoint
    Then  I expect a '400' status code

  @delete_templates
  Scenario: send without param description
    Given I make a 'PUT' request to '/templates/$id' endpoint
    When I set the body as:
    """
     {
        "name": "test template",
        "subjectTemplate": "subject is valid for this case",
        "contentTemplate": "content is valid for this case"
     }
    """
    When I execute the request to the endpoint
    Then  I expect a '200' status code
    And I build the response for "template" with
    """
      {
        "description": null
      }
    """
    And The response body is the same as builded