@all @functional
Feature: Functional get for channels with params name

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
    And I save the 'id' of 'channels'
  @delete_channel
  Scenario: Get channel of type WEB_HOOK
    Given I make a 'GET' request to '/channels' with:
    | name | AT04-Web-Hook-Demo |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "channels" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel of type WEB_HOOK
    Given I make a 'GET' request to '/channels' with:
    | name       | at04-web-hook-demo |
    | ignoreCase | true               |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "channels" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Get channel of type WEB_HOOK
    Given I make a 'GET' request to '/channels' with:
    | name       | AT04-Web-Hook-Demo |
    | ignoreCase | false              |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "channels" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
