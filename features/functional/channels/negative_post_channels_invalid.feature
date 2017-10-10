@all @functional
Feature: Negative responses after making a post request
  @delete_channel
  Scenario Outline: Create a new channel with invalid or empty params
    Given I make a 'POST' request to '/channels' endpoint
    And I set the body as:
    """
    {
      "name": <Name>,
      "type": <Type>,
      "configuration": {
        "url": "https://www.example.com/"
      }
    }
    """
    When I execute the request to the endpoint
    Then I expect a '400' status code
    And I save the 'id' of 'channels'
    And the response body contains excluding 'timestamp':
    """
      {
        "status": 400,
        "error": "Bad Request",
        "exception": "org.springframework.http.converter.HttpMessageNotReadableException",
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    Examples:
    | Name    | Type    |
    |         |         |
    |         | "SLACK" |
    |         | "SLAC"  |
    | ""      | ""      |
    | ""      | "SLAC"  |
    | ""      | $       |
    | $       |         |
    | $       | #       |
    | $       | "SLACK" |
    | $       | "SLAC"  |
    | $       | ""      |
    | "AT-04" |         |
    | "AT-04" | ""      |
    | "AT-04" | $       |
    | 1       |         |
    | 1       | ""      |
    | 1       | $       |
