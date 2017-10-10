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
  Scenario Outline: Update a created channel for WebHook, Email and Twitter with invalid params
    Given I make a 'PUT' request to '/channels/$id' endpoint
    And I set the body as:
    """
    {
      "name": "<Name>",
      "type": "<Type>",
      "configuration": {
        <Configuration>
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
        "message": "Bad Request"
      }
    """
    Examples:
    | Name              | Type     | Configuration                                              | Errors                                                                                                                                                        |
    |                   | SLACK    | "url": "https://www.example.com/"                          | { "field": "name", "code": "name.required", "defaultMessage": null }                                                                                          |
    | AT04-Slack-Demo   | SLACK    |                                                            | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    | AT04-Slack-Demo   | SLACK    | "url": ""                                                  | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    | AT04-Slack-Demo   | SLACK    | "url": "www.example.com/"                                  | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    | AT04-Slack-Demo   | SLACK    | "url": "https:://www.example.com/***/***/"                 | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    |                   | WEB_HOOK | "url": "https://www.example.com/"                          | { "field": "name", "code": "name.required", "defaultMessage": null }                                                                                          |
    | AT04-WebHook-Demo | WEB_HOOK |                                                            | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    | AT04-WebHook-Demo | WEB_HOOK | "url": ""                                                  | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    | AT04-WebHook-Demo | WEB_HOOK | "url": "www.example.com/"                                  | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    | AT04-WebHook-Demo | WEB_HOOK | "url": "https:://www.example.com/***/***/"                 | { "field": "configuration", "code": "url.required", "defaultMessage": null }                                                                                  |
    |                   | EMAIL    | "mail.from":"example@example.com", "mail.host":"127.0.0.1" | { "field": "name", "code": "name.required", "defaultMessage": null }                                                                                          |
    | AT04-Email-Demo   | EMAIL    |                                                            | { "field": "configuration", "code": "email.required", "defaultMessage": null }, { "field": "configuration", "code": "host.required", "defaultMessage": null } |
    | AT04-Email-Demo   | EMAIL    | "mail.from":"", "mail.host":""                             | { "field": "configuration", "code": "email.required", "defaultMessage": null }, { "field": "configuration", "code": "host.required", "defaultMessage": null } |
    | AT04-Email-Demo   | EMAIL    | "mail.from":"example@example.com", "mail.host":""          | { "field": "configuration", "code": "host.required", "defaultMessage": null }                                                                                 |
    | AT04-Email-Demo   | EMAIL    | "mail.from":"", "mail.host":"127.0.0.1"                    | { "field": "configuration", "code": "email.required", "defaultMessage": null }                                                                                |
