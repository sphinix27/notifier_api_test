@crud
Feature: POST request for notification endpoint

  Background:
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "AT04-Slack-Demo-for-Notifications",
      "type": "SLACK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id

  @delete_channel
  Scenario Outline: Send a new notification
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body with id:
    """
         {
         "channelId": $id,
         "priority": "<priority>",
         "recipients": [<recipients>],
          "subject": "<subject>",
          "content": "<content>"
          }
          """
    And I execute the request to the endpoint
    Then I expect a '<status_code>' status code
    And I build the response for "notification" with
   """
      {
        "attachments": null,
        "templateId": null
      }
    """
    Examples:
      | priority | recipients        | subject | content                          | status_code |
      | NORMAL   | "#general","main" | Test1   | A testing message from notifier1 | 200         |
      | NORMAL   | "#general"        | Test2   | A testing message from notifier2 | 200         |


