Given(/^I make a '(\w+)' request to '(.+)' endpoint$/) do |method, endpoint|
  @request = ApiRequest.new(EnpointBuilder.builder(endpoint))
  @request.method = method
end

When(/^I execute the request to the endpoint$/) do
  @response = RequestManager.execute_request(@request)
end

Then(/^I expect a '(\d+)' status code$/) do |status_code_expected|
  expect(@response.code).to eql(status_code_expected.to_i)
end

And(/^I make a '(PUT|POST|GET)' request to '(.+)' with:$/) do |method, endpoint, param|
  @request = ApiRequest.new(EnpointBuilder.param(endpoint, param.raw))
  @request.method = method
end

Then(/^The response body is$/) do |expected_body|
  expect(JSON.parse(@response.body)).to eq JSON.parse(expected_body)
end

When(/^I set the body as:$/) do |body|
  @body = body
  @request.body = body
end

When(/^I save the id$/) do
  $id = JSON.parse(@response.body)['id']
end

Then(/^I build the response for "([^"]*)" with$/) do |template, json|
  @builded_hash = ResponseManager.build_response(template, @body, json, @response.body)
end

Then(/^The response body is the same as builded$/) do
  expect(@builded_hash.to_json).to eq @response.body
  # expect(@builded_hash[0].keys).to contain_exactly("id", "name", "type", "configuration", "onFail")
  puts @builded_hash.to_json
  puts @response.body
end

Then(/^I capture the response to the endpoint$/) do
  @stored_response = @response.body
end

Then(/^I expect (?:PUT|POST) response is the same as GET response$/) do
  expect(JSON.parse(@response.body)).to eq JSON.parse(@stored_response)
end

Then(/^I expect that the GET response it is empty$/) do
  expect(@response.body).to eq ''
end

Given(/^sleep$/) do
  sleep 3
end

And(/^I make a '(\w+)' request to '(.+)' until the field '(.+)' at '(.+)' is '(.+)'$/) do |method, endpoint, field, params, value|
  time = 0
  result_expected = JSON.parse(@response.body)[field][params]
  until result_expected == value
    sleep 1
    time += 1
    steps %{
        And I make a '#{method}' request to '#{endpoint}' endpoint
        And I execute the request to the endpoint
     }
    result_expected = JSON.parse(@response.body)[field][params]
    if time <= $maxWaitTime.to_i
      break
    end
  end
  expect(value).to eq result_expected
end

Then(/^I build the error response with$/) do |json|
  @builded_hash = ResponseManager.build_error_response('error', json, @response.body)
end
