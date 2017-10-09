@all @crud
Feature: CRUD resend notification

  Background: send a notification
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "Channel test resend AS:",
      "type": "SLACK",
      "configuration": {
      "url": "https://hooks.slack.com/services/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"
      }
    }
    """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'channels'
    Then I make a 'POST' request to '/notifications' endpoint
    When I set the body with id:
      """
      {
        "channelId": $channels_id,
        "priority": "HIGH",
        "recipients": ["#general"],
        "subject": "test API",
        "content": "Hi there, The JCN team is making a demo about Notifier RESENDA."
      }
      """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'notification'
    Then I make a 'GET' request to '/notifications/$id' until the field 'notification' at 'status' is 'DELIVERED'

  @delete_channel
  Scenario: resend a notification without param
    Given I make a 'POST' request to '/notifications/events/$id/resend' endpoint
    When I execute the request to the endpoint
    Then I make a 'GET' request to '/notifications/$id' until the field 'notification' at 'status' is 'DELIVERED'
    Then I expect a '200' status code


  @delete_channel
  Scenario: resend a notification with param
    Given I make a 'POST' request to '/notifications/events/$id/resend' with:
      | recipient | #general |
    When I execute the request to the endpoint
    Then I make a 'GET' request to '/notifications/$id' until the field 'notification' at 'status' is 'DELIVERED'
    Then I expect a '200' status code
