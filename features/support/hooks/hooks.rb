# Delete channel
After('@delete_channel') do
  puts "///////////////////////////   HOOKS ///////////////////"
  p $id_hash
  enpoint = "/channels/#{$id_hash['channels_id'].to_s}"
      # EnpointBuilder.builder('/channels/$id')
  puts "////////////////////////////////////////////"
  puts enpoint
  request = ApiRequest.new(enpoint)
  request.method = 'DELETE'
  RequestManager.execute_request(request)
end
