@crud
Feature: CRUD resend notification

  Background: send a notification
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "Chanel test resendas",
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
        "channelId": $id,
        "priority": "HIGH",
        "recipients": ["#general"],
        "subject": "test API",
        "content": "Hi there, The JCN team is making a demo about Notifier RESEND."
      }
      """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'notification'

  @delete_channel
  Scenario: resend a notification without param
    Given I make a 'POST' request to '/notifications/events/$id/resend' until that 'status' is 'DELIVERED'
    Then I expect a '200' status code

#  Scenario: resend a notification with param
#    Given I make a 'POST' request to '/notifications/events/$id/resend' with:
#      | recipient | #general |
#    When I execute the request to the endpoint
#    Then I expect a '200' status code
