Feature:Channels

  Scenario: Get all Channels
    Given I make a 'GET' request to '/channels' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code