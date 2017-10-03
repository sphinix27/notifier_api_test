require 'json'
require 'hashdiff'

# Manage the conversion of hashes and string to json
module ResponseManager
  def self.hash_to_json(hash)
    hash.to_json
  end

  def self.string_to_json(string)
    JSON.parse string
  end

  def self.parse_file_to_hash(filename)
    file = File.read(filename)
    @template_hash = JSON.parse(file)
  end

  def self.copy_template
    @hash = Hash[@template_hash]
  end

  def self.replace_in_hash(hash)
    @template_hash.each { |key, value|
      @hash[key] = hash[key] if !(@template_hash[key].eql? hash[key]) && (hash.has_key? key)
    }
    @hash
  end

  def self.diff_hash(hash)
    hash.delete_if {|key, value| !(@hash[key].eql? @template_hash[key])}
    p hash
  end
end
