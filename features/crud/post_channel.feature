Feature: Post request for channels endpoint
  Scenario: Create a new channel
    Given I make a 'POST' request to '/channels'
    When I set the body as:
    """
    {
      "name":"AT04",
      "type":"WEB_HOOK",
      "configuration":{
        "url":"https://web.webhooks.com/services/..."
      }
    }
    """
    And I execute the request
    And I save the id as "channelId"
    Then I expect a '200' status code
    And The response body is
    """
      {
        "name": "AT04",
        "type": "WEB_HOOK",
        "configuration": {
            "url":"https://web.webhooks.com/services/..."
        },
        "onFail": null
      }
    """
