@all @functional
Feature: Puts request for channels endpoint

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
  Scenario Outline: Update channel by id
    Given I make a 'PUT' request to '/channels/$id' endpoint
    And I set the body as:
    """
    {
      "name": "<Name>",
      "type": "<Type>",
      "configuration": {
        <Configuration>
      }
      <OnFail>
    }
    """
    When I execute the request to the endpoint
    Then I expect a '200' status code
    And I save the 'id' of 'channels'
    And I build the response for "channel" with
    """
      {
      }
    """
    And The response body is the same as builded
    Examples:
    | Name              | Type     | Configuration                                                                                | OnFail                  |
    | AT04-Slack-Demo   | SLACK    | "url": "https://hooks.slack.com"                                                             | ,"onFail": "https://hooks.slack.com" |
    | AT04-Slack-Demo   | SLACK    | "url": "https://hooks.slack.com"                                                             | ,"onFail": "" |
    | AT04-Slack-Demo   | SLACK    | "url": "https://hooks.slack.com"                                                             |  |
    | AT04-WebHook-Demo | WEB_HOOK | "url": "https://hooks.slack.com"                                                             | ,"onFail": "https://hooks.slack.com" |
    | AT04-WebHook-Demo | WEB_HOOK | "url": "https://hooks.slack.com"                                                             | ,"onFail": "" |
    | AT04-WebHook-Demo | WEB_HOOK | "url": "https://hooks.slack.com"                                                             |  |
    | AT04-Email-Demo   | EMAIL    | "mail.from":"example@jalasoft.com", "mail.host":"127.0.0.1"                                  | ,"onFail": "https://hooks.slack.com" |
    | AT04-Email-Demo   | EMAIL    | "mail.from":"example@jalasoft.com", "mail.host":"127.0.0.1"                                  | ,"onFail": "" |
    | AT04-Email-Demo   | EMAIL    | "mail.from":"example@jalasoft.com", "mail.host":"127.0.0.1"                                  |  |
    | AT04-Twitter-Demo | TWITTER  | "access_token": "a", "consumer_key": "b", "consumer_secret": "c", "access_token_secret": "d" | ,"onFail": "https://hooks.slack.com" |
    | AT04-Twitter-Demo | TWITTER  | "access_token": "a", "consumer_key": "b", "consumer_secret": "c", "access_token_secret": "d" | ,"onFail": "" |
    | AT04-Twitter-Demo | TWITTER  | "access_token": "a", "consumer_key": "b", "consumer_secret": "c", "access_token_secret": "d" |  |

