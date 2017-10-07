@all @crud
Feature: CRUD for channels

  Background:
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "AT04-Slack-Demo11",
      "type": "SLACK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'channels'
  @delete_channel
  Scenario: Update channel by id
    Given I make a 'PUT' request to '/channels/$id' endpoint
    And I set the body as:
    """
    {
      "name": "AT04-Slack-Demo-Updated11",
      "type": "SLACK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "channel" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
