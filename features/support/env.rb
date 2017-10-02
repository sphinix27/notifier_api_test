require 'pathname'
require 'yaml'

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

def load_bd_config_file(filename)
  config_file = find_config_file(filename)
  config_bd = YAML.load_file(config_file)
  $bd_context = config_bd['database']['connection']
  config_bd
end

AfterConfiguration do
  # read config file
  configuration = load_app_config_file('env.yml')
  configuration_bd = load_bd_config_file('env.yml')
  # Load application configuration parameters
  $app_host = configuration['app']['host']
  $app_port = configuration['app']['port']
  $app_root = configuration['app']['rootPath']
  $bd_connection = configuration_bd['database']['connection']
  $bd_host = configuration_bd['database']['host']
  $bd_port = configuration_bd['database']['port']
  $bd_database = configuration_bd['database']['database']
  $bd_username = configuration_bd['database']['username']
  $bd_password = configuration_bd['database']['password']
end
