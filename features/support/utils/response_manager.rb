# Manage the conversion of hashes and string to json
module ResponseManager
  def self.parse_file_to_hash(filename)
    path = "./features/support/utils/templates/#{filename}.json"
    file = File.read(path)
    @template_hash = JSON.parse(file)
    @hash = Hash[@template_hash]
  end

  def self.replace_in_hash(hash)
    @template_hash.each_key do |key|
      if !(@template_hash[key].eql? hash[key]) && (hash.key? key)
        @hash[key] = hash[key]
      end
    end
    @hash
  end

  def self.diff_hash(hash)
    hash.delete_if { |key| !(@hash[key].eql? @template_hash[key]) }
  end
end
