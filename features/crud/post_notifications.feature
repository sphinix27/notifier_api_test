@crud
Feature: POST request for notification endpoint

  Scenario Outline: Send a new notification
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body as:
    """
         {
         "channelId": <channelId>,
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
      | channelId | priority | recipients        | subject | content                          | status_code |
      | 18        | NORMAL   | "#general","main" | Test    | A testing message from notifier1 | 200         |
      | 18        | NORMAL   | "#general"        | Test2   | A testing message from notifier2 | 200         |


