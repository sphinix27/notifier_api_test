# Delete channel
After('@delete_channel') do
  request = ApiRequest.new(EnpointBuilder.builder('/channels/$id'))
  request.method = 'DELETE'
  RequestManager.execute_request(request)
end
