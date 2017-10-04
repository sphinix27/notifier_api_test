@crud
Feature: Post request for channels endpoint
  @delete_channel
  Scenario: Create a new channel
    Given I make a 'POST' request to '/channels' endpoint
    And I set the body as:
    """
    {
      "name": "AT04-Slack-Demo",
      "type": "SLACK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id
    And I build the response for "channel" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
  @delete_channel
  Scenario: Create a new channel
    Given I make a 'POST' request to '/channels' endpoint
    And I set the body as:
    """
    {
      "name": "AT04-WebHook-Demo",
      "type": "WEB_HOOK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id
    And I build the response for "channel" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded

  @delete_channel
  Scenario: Create a new channel
    Given I make a 'POST' request to '/channels' endpoint
    And I set the body as:
    """
    {
      "name": "AT04-Email-Demo",
      "type": "EMAIL",
      "configuration":{
        "mail.from":"example@jalasoft.com",
        "mail.host":"127.0.0.1"
      }
    }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id
    And I build the response for "channel" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded

  @delete_channel
  Scenario: Create a new channel
    Given I make a 'POST' request to '/channels' endpoint
    And I set the body as:
    """
    {
      "name": "AT04-Twitter-Demo",
      "type": "TWITTER",
      "configuration": {
          "access_token": "912661821122805760-7NTyIrDHEeoa534SduWW3TQLBUaQzLm",
          "consumer_key": "KHjTQXRMRMO5N87oOVS7mR8lf",
          "consumer_secret": "LKj4G8C9FvokkBeBTrc120qKIl2oMbwLJdUYUqqkIQJIRKlHzO",
          "access_token_secret": "W47sYHdMXafd9kZK77aUEmnXaOIZDuJTrWGsV8DuPJNm8"
      }
    }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id
    And I build the response for "channel" with
    """
      {
        "onFail": null
      }
    """
    And The response body is the same as builded
