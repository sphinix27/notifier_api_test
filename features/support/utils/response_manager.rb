require 'json'

# Manage the conversion of hashes and string to json
module ResponseManager
  def self.hash_to_json(hash)
    hash.to_json
  end

  def self.string_to_json(string)
    JSON.parse string
  end
end
