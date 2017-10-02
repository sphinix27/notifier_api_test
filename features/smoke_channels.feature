Feature:Smoke Test Channels

  Scenario:Get all Channels
    Given I make a 'GET' request to '/channels'
    When I execute the request
    Then I expect a '200' status code