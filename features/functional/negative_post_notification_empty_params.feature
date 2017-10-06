Feature: Negative responses after making a post request

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

  @delete_channel
  Scenario Outline: Send a new notification without the parameter
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
    Then I expect a '400' status code
    And the response body contains excluding 'timestamp':
    """
      {
        "status": 400,
        "error": "Bad Request",
        "exception": "org.springframework.web.bind.MethodArgumentNotValidException",
        "errors": [
           {
            "field": "<field>",
            "code":  "<code>",
            "defaultMessage": <default_message>
           }
        ],
        "message": "Bad Request",
        "path": "/notifications"
      }
    """
    Examples:
      | priority | recipients | subject | content                         | field   | code             | default_message |
      | NORMAL   | "#general" |         | A testing message from notifier | subject | subject.required | null            |
      | NORMAL   | "#general" | Test    |                                 | content | content.required | null            |

  @delete_channel
  Scenario Outline: Send a new notification without subject and content parameter
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
    Then I expect a '400' status code
    And the response body contains excluding 'timestamp':
    """
      {
        "status": 400,
        "error": "Bad Request",
        "exception": "org.springframework.web.bind.MethodArgumentNotValidException",
            "errors": [
        {
            "field": "subject",
            "code": "subject.required",
            "defaultMessage": null
        },
        {
            "field": "content",
            "code": "content.required",
            "defaultMessage": null
        }
        ],
        "message": "Bad Request",
        "path": "/notifications"
      }
    """
    Examples:
      | priority | recipients | subject | content |
      | NORMAL   | "#general" |         |         |
