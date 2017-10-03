module EnpointBuilder
  def EnpointBuilder.builder enpoint
    enpoint = enpoint.gsub('$id', $id.to_s)
    puts enpoint
  end

end

# EnpointBuilder::builder 'notifications/{id}/asd'