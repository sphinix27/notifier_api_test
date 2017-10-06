# Delete channel
After('@delete_channel') do
  endpoint = "/channels/#{$id_hash['channels_id']}"
  request = ApiRequest.new(endpoint)
  request.method = 'DELETE'
  RequestManager.execute_request(request)
end
