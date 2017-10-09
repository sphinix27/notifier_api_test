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
        "channelId": $id,
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
  Scenario Outline: Get notification with invalid id
    Given I make a 'GET' request to '/notifications/<Id>' endpoint
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And the response body contains excluding 'timestamp':
    """
      {
        "status": 400,
        "error": "Bad Request",
        "exception": "org.springframework.web.method.annotation.MethodArgumentTypeMismatchException",
        "message": "Bad Request",
        "path": "/notifications/<Id>"
      }
    """
    Examples:
      | Id                      |
      | abc                     |
      | !@$                     |
      | c4d6@                   |
      | c4d6.                   |
      | c4d6.1                  |
      | c4d6.a                  |
      | c4d6.$                  |
      | c4d6f70e-a693-47be-aedf |
      | ef79dfdc-88ee           |

  @delete_channel
  Scenario Outline: Can't Find a notification with nonexistent id
    Given I make a 'GET' request to '/notifications/<Id>' endpoint
    When I execute the request to the endpoint
    Then I expect a '404' status code
    And the response body contains excluding 'timestamp':
      """
      {
        "status": 404,
        "error": "Not Found",
        "exception": "javax.persistence.EntityNotFoundException",
        "message": "Notification not found with the id: <Id>",
       "path": "/notifications/<Id>"
      }
    """
    Examples:
      | Id                                   |
      | ef79dfdc-88ee-475b-9f5d-deb532cf3988 |
      | c4d6f70e-a693-47be-aedf-2b912e9f3e12 |
