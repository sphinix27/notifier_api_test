Feature:Specific Channels

  Scenario: Get a specific channel
    Given I make a 'GET' request to '/channels/1' endpoint
    When I execute the request to the endpoint
    Then I expect a '200' status code