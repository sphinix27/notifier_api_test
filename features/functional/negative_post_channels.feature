# @functional
# Scenario: Negative responses after making a post request
#   @delete_channel
#   Scenario Outline: Create a new channel for WebHook, Email and Twitter with invalid params
#     Given I make a 'POST' request to '/channels' endpoint
#     And I set the body as:
#     """
#     {
#       "name": "<Name>",
#       "type": "<Type>",
#       "configuration": {
#         <Configuration>
#       },
#       "onFail": "<OnFail>"
#     }
#     """
#     When I execute the request to the endpoint
#     Then I expect a '400' status code
#     And I save the 'id' of 'channels'
#     And I build the response for "channel" with
#     """
#       {
#       }
#     """
#     And The response body is the same as builded
#     Examples:
#     | Name              | Type     | Configuration                                                                                                                                                                                                                                                      | OnFail                                                                        |
#     | AT04-Slack-Demo   | SLACK    | "url": "https://hooks.slack.com/services/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"                                                                                                                                                                             | https://hooks.slack.com/services/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 |
#     | AT04-WebHook-Demo | WEB_HOOK | "url": "https://hooks.slack.com/services/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"                                                                                                                                                                             | https://hooks.slack.com/services/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 |
#     | AT04-Email-Demo   | EMAIL    | "mail.from":"example@jalasoft.com", "mail.host":"127.0.0.1"                                                                                                                                                                                                        | https://hooks.slack.com/services/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 |
#     | AT04-Twitter-Demo | TWITTER  | "access_token": "912661821122805760-7NTyIrDHEeoa534SduWW3TQLBUaQzLm", "consumer_key": "KHjTQXRMRMO5N87oOVS7mR8lf", "consumer_secret": "LKj4G8C9FvokkBeBTrc120qKIl2oMbwLJdUYUqqkIQJIRKlHzO", "access_token_secret": "W47sYHdMXafd9kZK77aUEmnXaOIZDuJTrWGsV8DuPJNm8" | https://hooks.slack.com/services/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 |
