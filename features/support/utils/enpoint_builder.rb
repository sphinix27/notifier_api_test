# This module build endpoint with id and params
module EnpointBuilder
  def self.builder(enpoint)
    enpoint.gsub('$id', $id.to_s)
  end

  def self.param(endpoint, param)
    point = builder endpoint
    param.each_with_index do |value, index|
      params = "#{value[0].gsub(' ', '%20')}=#{value[1].gsub(' ', '%20')}"
      point = index.to_i.zero? ? "#{point}?#{params}" : "#{point}&#{params}"
    end
    puts point
    point
  end
end
