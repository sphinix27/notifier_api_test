Given(/^I make a '(\w+)' request to '(.+)'$/) do |method, endpoint|
  # TODO: Method for build the endpoint
  @request = ApiRequest.new(endpoint)
  @request.method = method
end

When(/^I execute the request$/) do
   @response = RequestManager.execute_request(@request)
end

Then(/^I expect a '(\d+)' status code$/) do |status_code_expected|
  expect(@response.code).to eql(status_code_expected.to_i)
end

Then(/^The response body is$/) do |expected_body|
  expect(JSON.parse(@response.body)).to eq JSON.parse(expected_body)
end

When(/^I set the body as:$/) do |body|
  @request.body = body
end

When(/^I save the id as "([^"]*)"$/) do |id|
  pending # Write code here that turns the phrase above into concrete actions
end
