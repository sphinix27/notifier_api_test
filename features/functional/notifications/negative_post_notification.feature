@all @functional
Feature: Negative responses after making a post request .

  Background: Create a Channel
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

  @delete_channel @bug
  Scenario Outline: Send a new notification with a recipient greater than 256 characters
    Given I make a 'POST' request to '/notifications' endpoint
    And I generate 'a' letter <number_of_letters> times and save
    When I set the body with id:
    """
         {
          "channelId": $channels_id,
          "recipients": ["<recipients>"],
          "content": "<content>"
          }
          """
    And I execute the request to the endpoint
    Then I expect a '400' status code
    And I save the 'id' of 'notification'
    And the response body contains excluding 'timestamp':
   """
     {
    "status": 400,
    "error": "Bad Request",
    "exception": "org.springframework.web.bind.MethodArgumentNotValidException",
    "errors": [
        {
            "field": "recipients",
            "code": "Size",
            "defaultMessage": "size must be between 4 and 22"
        }
    ],
    "message": "Bad Request",
    "path": "/notifications"
     }
    """
    Examples:
      | recipients | content                           | number_of_letters |
      | $name      | A testing message from notifier 1 | 256               |
      | $name      | A testing message from notifier 1 | 257               |
      | $name      | A testing message from notifier 1 | 300               |
