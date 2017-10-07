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
  Scenario Outline: Update a existent channel to Twitter with invalid params
    Given I make a 'PUT' request to '/channels/$id' endpoint
    And I set the body as:
    """
    {
      "name": "AT04-Twitter-Demo",
      "type": "TWITTER",
      "configuration": {
        "access_token": "<A_Token>",
        "consumer_key": "<C_Key>",
        "consumer_secret": "<C_Secret>",
        "access_token_secret": "<A_T_Secret>"
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
        "exception": "org.springframework.web.bind.MethodArgumentNotValidException",
        "errors": [
          <Errors>
        ],
        "message": "Bad Request",
        "path": "/channels"
      }
    """
    Examples:
| A_Token | C_Key | C_Secret | A_T_Secret | Errors                                                                                                                                                                                                                                                                                                                                                               |
|         | b     | c        | d          | { "field": "configuration", "code": "access_token.required", "defaultMessage": null }                                                                                                                                                                                                                                                                                |
|         | 2     | 3        | 4          | { "field": "configuration", "code": "access_token.required", "defaultMessage": null }                                                                                                                                                                                                                                                                                |
| %        | 2     | 3        | 4          | { "field": "configuration", "code": "access_token.required", "defaultMessage": null }                                                                                                                                                                                                                                                                                |
| a       |       | c        | d          | { "field": "configuration", "code": "consumer_key.required", "defaultMessage": null }                                                                                                                                                                                                                                                                                |
| a       |       | c        | d          | { "field": "configuration", "code": "consumer_key.required", "defaultMessage": null }                                                                                                                                                                                                                                                                                |
| 1       | ^      | 3        | 4          | { "field": "configuration", "code": "consumer_key.required", "defaultMessage": null }                                                                                                                                                                                                                                                                                |
| a       | b     |          | d          | { "field": "configuration", "code": "consumer_secret.required", "defaultMessage": null }                                                                                                                                                                                                                                                                             |
| 1       | 2     |          | 4          | { "field": "configuration", "code": "consumer_secret.required", "defaultMessage": null }                                                                                                                                                                                                                                                                             |
| a       | b     |     &     | d          | { "field": "configuration", "code": "consumer_secret.required", "defaultMessage": null }                                                                                                                                                                                                                                                                             |
| a       | b     | c        |            | { "field": "configuration", "code": "access_token_secret.required", "defaultMessage": null }                                                                                                                                                                                                                                                                         |
| 1       | 2     | 3        |            | { "field": "configuration", "code": "access_token_secret.required", "defaultMessage": null }                                                                                                                                                                                                                                                                         |
| 1       | 2     | 3        |    *       | { "field": "configuration", "code": "access_token_secret.required", "defaultMessage": null }                                                                                                                                                                                                                                                                         |
|         |       |          |            | { "field": "configuration", "code": "consumer_key.required", "defaultMessage": null }, { "field": "configuration", "code": "consumer_secret.required", "defaultMessage": null }, { "field": "configuration", "code": "access_token.required", "defaultMessage": null }, { "field": "configuration", "code": "access_token_secret.required", "defaultMessage": null } |
| $       | #     | @        | !          | { "field": "configuration", "code": "consumer_key.required", "defaultMessage": null }, { "field": "configuration", "code": "consumer_secret.required", "defaultMessage": null }, { "field": "configuration", "code": "access_token.required", "defaultMessage": null }, { "field": "configuration", "code": "access_token_secret.required", "defaultMessage": null } |
