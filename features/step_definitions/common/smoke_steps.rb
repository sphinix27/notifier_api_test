Given(/^I make a '(GET|POST)' request to '(.+)'$/) do |method, endpoint|
  @method = method
  EnpointBuilder::builder endpoint
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


Given(/^value id: (\d+)$/) do |id|
  $id =id
end


And(/^I make a '(PUT|POST)' request to '(.+)' with paramethers:$/) do |method, enpoint, paramether|
  # table is a table.hashes.keys # => [:type, :slack]
  paramether.column_names.each do |field|
    puts field
  end

  puts paramether.content_columns

end