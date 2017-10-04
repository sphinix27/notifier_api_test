@crud
Feature: GET request for notification endpoint

  Background:
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body as:
         """
         {
         "channelId": 510 ,
         "priority": "NORMAL",
         "recipients": ["#general"],
          "subject": "Test",
          "content": "A testing message from notifier"
          }
          """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id'

  Scenario: Get notification by id
    Given I make a 'GET' request to '/notifications/$id' endpoint
    When I execute the request to the endpoint
    Then I make a 'GET' request to '/notifications/$id' until the field 'notification' at 'status' is 'DELIVERED'




