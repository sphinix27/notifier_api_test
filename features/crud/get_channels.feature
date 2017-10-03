Feature: CRUD for channels

  Scenario: Get channel by id
    Given I make a 'GET' request to '/channels/11'
    When I execute the request
    Then I expect a '200' status code
    And The response body is
    """
      {
        "id": 11,
        "name": "Slack at-04",
        "type": "SLACK",
        "configuration": {
            "url": "https://hooks.slack.com/services/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"
        },
        "onFail": null
      }
    """
