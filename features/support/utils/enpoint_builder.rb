module EnpointBuilder
  def EnpointBuilder.builder enpoint
    enpoint.gsub('$id', $id.to_s)
  end
  def EnpointBuilder.builderWithParamethers enpoint, paramethers
    enpoint = builder enpoint
    paramethers.each_with_index do |value, index|
      (index.to_i ==0) ? enpoint = "#{enpoint}?#{value[0]}=#{value[1]}" : enpoint = "#{enpoint}&#{value[0]}=#{value[1]}"
    end
    enpoint
  end
end
