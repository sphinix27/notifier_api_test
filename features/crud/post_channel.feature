Feature: Post request for channels endpoint
  Scenario: Create a new channel
    Given I make a 'POST' request to '/channels'
    When I set the body as:
    """
    {
      "name": "AT04-Slack-Demo",
      "type": "SLACK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    And I execute the request
    And I save the id as "channelId"
    Then I expect a '200' status code
    And The response body is
    """
      {
        "onFail": null
      }
    """
