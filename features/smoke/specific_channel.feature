@smoke @all
Feature: Specific Channels

  Background: Create a Channel
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "AT04-Slack-Demo-for-A-Specific-Channel",
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
  Scenario: Get a specific channel
    Given I make a 'GET' request to '/channels/$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
