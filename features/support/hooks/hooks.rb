# Delete channel
After('@delete_channel') do
  enpoint = "/channels/#{$id_hash['channels_id'].to_s}"
  request = ApiRequest.new(enpoint)
  request.method = 'DELETE'
  RequestManager.execute_request(request)
end

# Delete templates
After('@delete_templates') do
  enpoint = "/templates/#{$id_hash['templates_id'].to_s}"
  request = ApiRequest.new(enpoint)
  request.method = 'DELETE'
  RequestManager.execute_request(request)
end

