@all @functional
Feature: Functional get for channels with params type for EMAIL

  Background:
    Given I make a 'POST' request to '/channels' endpoint
    When I set the body as:
    """
    {
      "name": "AT04-Email-Demo",
      "type": "EMAIL",
      "configuration": {
        "mail.from": "example@example.com",
        "mail.host": "40.97.162.130"
      }
    }
    """
    And I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'channels'
  @delete_channel
  Scenario: Get channel of type EMAIL
    Given I make a 'GET' request to '/channels' with:
    | type | EMAIL |
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I build the response for "channels" with
    """
      {
        "onFail": null
      }
    """
    And The response body should contain the builded response
