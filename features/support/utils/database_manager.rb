# Conect to Database
module DatabaseManager
  def self.conn
    PG.connect host: $bd_host,
               port: $bd_port,
               dbname: $bd_database,
               user: $bd_username,
               password: $bd_password
  end
end
