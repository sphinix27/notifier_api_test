Given(/^I make a '(\w+)' request to '(.+)' endpoint$/) do |method, endpoint|
  @request = ApiRequest.new(EnpointBuilder.builder(endpoint))
  @request.method = method
  puts EnpointBuilder.builder(endpoint)
end

When(/^I execute the request to the endpoint$/) do
  @response = RequestManager.execute_request(@request)
end

Then(/^I expect a '(\d+)' status code$/) do |status_code_expected|
  expect(@response.code).to eql(status_code_expected.to_i)
end

And(/^I make a '(PUT|POST)' request to '(.+)' with:$/) do |method, endpoint, param|
  @request = ApiRequest.new(EnpointBuilder.param(endpoint, param.raw))
  @request.method = method
end

Then(/^The response body is$/) do |expected_body|
  expect(JSON.parse(@response.body)).to eq JSON.parse(expected_body)
end

When(/^I set the body as:$/) do |body|
  @body = JSON.parse(body)
  @request.body = body
end

When(/^I save the id$/) do
  $id = JSON.parse(@response.body)['id']
end

Then(/^I build the response for "([^"]*)" with$/) do |template, json|
  ResponseManager.parse_file_to_hash(template)
  ResponseManager.replace_in_hash(@body)
  ResponseManager.replace_in_hash(JSON.parse(json))
  response_hash = ResponseManager.diff_hash(JSON.parse(@response.body))
  @builded_hash = ResponseManager.replace_in_hash(response_hash)
end

Then(/^The response body is the same as builded$/) do
  expect(@builded_hash.to_json).to eq @response.body
end


Given(/^sleep$/) do
  sleep 3
end
