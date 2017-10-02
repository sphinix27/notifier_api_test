require_relative '../../features/support/utils/api_request'
require_relative '../../features/support/utils/request_manager'

Given(/^I make a '(\w+)' request to '(.+)'$/) do |method, endpoint|
  @method = method
  @endpoint = endpoint
end
When(/^I execute the request$/) do
  smoke = ApiRequest.new(@endpoint)
  smoke.method = @method
  smoke.append_endpoint
  @response = RequestManager.execute_request(smoke)
end

Then(/^I expect a '(\d+)' status code$/) do |status_code_expected|
  expect(@response.code).to eql(status_code_expected.to_i)
end
