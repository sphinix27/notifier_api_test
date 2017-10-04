require 'json'
require 'pathname'
require 'pg'
require 'rest-client'
require 'yaml'
$id_hash = {}
def find_config_file(filename)
  root = Pathname.pwd
  until root.root?
    root.find do |path|
      return path.to_s if path.file? && path.basename.to_s == filename
    end
    root = root.parent
  end
  raise 'Configuration file '
end

def load_app_config_file(filename)
  config_file = find_config_file(filename)
  config = YAML.load_file(config_file)
  $app_context = config['app']['rootPath']
  config
end

AfterConfiguration do
  configuration = load_app_config_file('env.yml')
  $app_host = configuration['app']['host']
  $app_port = configuration['app']['port']
  $app_root = configuration['app']['rootPath']
  $app_max_wait_time = configuration['app']['maxWaitTime']
  $bd_connection = configuration['database']['connection']
  $bd_host = configuration['database']['host']
  $bd_port = configuration['database']['port']
  $bd_database = configuration['database']['database']
  $bd_username = configuration['database']['username']
  $bd_password = configuration['database']['password']
end
