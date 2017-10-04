@functional
Feature: Functional get for channels

  Background:
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "AT04-Slack-Demo",
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
  Scenario: Get channel of type WEB_HOOK
    Given I make a 'GET' request to '/channels' with:
    | type | WEB_HOOK |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "channel" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
