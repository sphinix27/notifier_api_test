Feature: CRUD resend notification

  Background: send a notification
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body as:
      """
      {
        "channelId": 510,
        "priority": "HIGH",
        "recipients": ["#general"],
        "subject": "test API",
        "content": "Hi there, The JCN team is making a demo about Notifier."
      }
      """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id'


  Scenario: resend a notification without param
    Given sleep
    And I make a 'POST' request to '/notifications/events/$id/resend' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code

#
#  Scenario: resend a notification with param
#    Given sleep
#    Given I make a 'POST' request to '/notifications/events/$id/resend' with:
#      | recipient | #general |
#    When I execute the request to the endpoint
#    Then I expect a '200' status code
