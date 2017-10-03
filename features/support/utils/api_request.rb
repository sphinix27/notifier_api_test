# ApiRequest class.
class ApiRequest
  attr_reader :header, :url
  attr_accessor :body, :method

  def initialize(endpoint)
    @endpoint = endpoint
    @header = { :'Content-Type' => 'application/json' }
    @body = {}
    @url = "#{$app_host}#{$app_root}#{endpoint}"
  end
end
