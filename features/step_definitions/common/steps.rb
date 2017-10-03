Given(/^I make a '(\w+)' request to '(.+)'$/) do |method, endpoint|
  @request = ApiRequest.new(EnpointBuilder.builder endpoint)
  @request.method = method
end

When(/^I execute the request$/) do
  @response = RequestManager.execute_request(@request)
end

Then(/^I expect a '(\d+)' status code$/) do |status_code_expected|
  expect(@response.code).to eql(status_code_expected.to_i)
end

And(/^I make a '(PUT|POST)' request to '(.+)' with:$/) do |method, endpoint, param|
  # table is a table.hashes.keys # => [:type, :slack]
  @request = ApiRequest.new(EnpointBuilder.param endpoint, param.raw)
  @request.method = method
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
