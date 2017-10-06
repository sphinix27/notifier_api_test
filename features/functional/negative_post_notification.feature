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
  Scenario Outline: Send a new notification without the "id channel" parameter
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body as:
    """
         {
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
            "field": "channelId",
            "code": "channelId.required",
            "defaultMessage": null
           }
        ],
        "message": "Bad Request",
        "path": "/notifications"
      }
    """
    Examples:
      | priority | recipients        | subject | content                         |
      | NORMAL   | "#general","main" | Test1   | A testing message from notifier |

  @delete_channel
  Scenario Outline: Send a new notification without the "recipients" parameter
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body with id:
    """
         {
          "channelId": $id,
          "priority": "<priority>",
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
            "field": "recipients",
            "code": "NotEmpty",
            "defaultMessage": "may not be empty"
         },
         {
            "field": "recipients",
            "code": "recipients.valid",
            "defaultMessage": null
         }
        ],
        "message": "Bad Request",
        "path": "/notifications"
      }
    """
    Examples:
      | priority | subject | content                         |
      | NORMAL   | Test1   | A testing message from notifier |

  @delete_channel
  Scenario Outline: Send a new notification with the "empty recipients" parameter
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body with id:
    """
         {
          "channelId": $id,
          "recipients": [<recipients>],
          "priority": "<priority>",
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
            "field": "recipients",
            "code": "recipients.valid",
            "defaultMessage": null
          }
         ],
        "message": "Bad Request",
        "path": "/notifications"
      }
    """
    Examples:
      | priority | recipients | subject | content                         |
      | NORMAL   | ""         | Test1   | A testing message from notifier |

