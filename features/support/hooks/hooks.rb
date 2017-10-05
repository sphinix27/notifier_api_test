# Delete channel
After('@delete_channel') do
  enpoint = "/channels/#{$id_hash['channels_id'].to_s}"
  request = ApiRequest.new(enpoint)
  request.method = 'DELETE'
  RequestManager.execute_request(request)
end
