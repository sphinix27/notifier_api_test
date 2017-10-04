@functional
Feature: Negative request get channels with invalid type

  Background:
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "AT04-Web-Hook-Demo",
      "type": "WEB_HOOK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id
  @delete_channel
  Scenario: Get channel of type ANOTHER or invalid
    Given I make a 'GET' request to '/channels' with:
    | type | ANOTHER |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel of type empty
    Given I make a 'GET' request to '/channels' with:
    | type |  |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel of name empty
    Given I make a 'GET' request to '/channels' with:
    | name |  |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel with nonexistent name
    Given I make a 'GET' request to '/channels' with:
    | name | Bad Name |
    When I execute the request to the endpoint
    Then I expect a '404' status code
    And I expect that the GET response it is empty
  @delete_channel
  Scenario: Get channel with correct name and empty ignoreCase
    Given I make a 'GET' request to '/channels' with:
    | name       | AT04-Web-Hook-Demo |
    | ignoreCase |                    |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel with correct name and invalid ignoreCase
    Given I make a 'GET' request to '/channels' with:
    | name       | AT04-Web-Hook-Demo |
    | ignoreCase | a                  |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel with empty name and valid ignoreCase
    Given I make a 'GET' request to '/channels' with:
    | name       |      |
    | ignoreCase | true |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel with empty name and valid ignoreCase
    Given I make a 'GET' request to '/channels' with:
    | name       |       |
    | ignoreCase | false |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel with empty name and empty ignoreCase
    Given I make a 'GET' request to '/channels' with:
    | name       |  |
    | ignoreCase |  |
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I build the error response with
    """
      {
        "status": 400,
        "error": "Bad Request",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    And The response body is the same as builded
