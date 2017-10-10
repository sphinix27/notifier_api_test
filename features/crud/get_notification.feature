@all @crud
Feature: GET request for notification endpoint

  Background: Send a notification
    Given I create a 'channel' with status code '200' and body as:
    """
    {
      "name": "AT04-Slack-Demo-for-Notifications",
      "type": "SLACK",
      "configuration": {
        "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    And I save the 'id' of 'channels'
    Then I make a 'POST' request to '/notifications' endpoint
    When I set the body with id:
      """
      {
        "channelId": $channels_id,
        "priority": "HIGH",
        "recipients": ["#general"],
        "subject": "Test API",
        "content": "A testing message from notifier."
      }
      """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'notification'

  @delete_channel
  Scenario: Get notification by id
    Given I make a 'GET' request to '/notifications/$id' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "notification_status_history" with
    """
      {
        "attachments": {},
        "templateId": null

      }
    """
    And The response body is the same as builded