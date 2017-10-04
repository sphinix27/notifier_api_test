@crud
Feature: GET request for notification endpoint

  Background:
    Given I make a 'POST' request to '/notifications' endpoint
    When I set the body as:
         """
         {
         "channelId": 18 ,
         "priority": "NORMAL",
         "recipients": ["#general"],
          "subject": "Test",
          "content": "A testing message from notifier"
          }
          """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the id

  Scenario: Get notification by id
    Given I make a 'GET' request to '/notifications/$id' endpoint
    When I execute the request to the endpoint
    Then I 'GET' request to '/notifications/$id' until the 'status' is 'DELIVERED'




