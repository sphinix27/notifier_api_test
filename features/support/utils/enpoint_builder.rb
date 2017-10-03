module EnpointBuilder
  def EnpointBuilder.builder enpoint
    enpoint.gsub('$id', $id.to_s)
  end
  def EnpointBuilder.builderWithParamethers endpoint, paramethers
    endpoint = builder endpoint
    paramethers.each_with_index do |value, index|
      (index.to_i ==0) ? endpoint = "#{endpoint}?#{value[0]}=#{value[1]}" : endpoint = "#{endpoint}&#{value[0]}=#{value[1]}"
    end
    endpoint
  end
end
