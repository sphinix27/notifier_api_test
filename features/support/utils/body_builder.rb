# This module build endpoint with id and params
module BodyBuilder
  def self.builder(body)
    $id_hash.each do |key, value|
      body = body.gsub("$#{key}", value.to_s)
    end
    body
  end
end
