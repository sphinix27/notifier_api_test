Feature:Specific Notification

  Scenario: Get a specific Notification
    Given I make a 'GET' request to '/notifications/3e8d2814-f298-4474-8767-a69fb3d4bcb2' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code