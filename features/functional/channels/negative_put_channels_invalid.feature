@all @functional
Feature: Negative responses after making a put request
  Background:
    Given I create a 'channel' with status code '200' and body as:
    """
    {
      "name": "AT04_Old_Name",
      "type": "SLACK",
      "configuration": {
        "url": "https://example.com"
      },
      "onFail": "https://fail.com"
    }
    """
    And I save the 'id' of 'channels'
  @delete_channel
  Scenario Outline: Update a created channel with invalid or empty params
    Given I make a 'PUT' request to '/channels/$id' endpoint
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
    And excluding 'timestamp' and 'path' the response body contains:
    """
      {
        "status": 400,
        "error": "Bad Request",
        "exception": "org.springframework.http.converter.HttpMessageNotReadableException",
        "message": "Bad Request"
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
