require_relative './app'
require_relative './lib/database_connection'
ENV["public_folder_cdn"] = "https://sertay.fra1.digitaloceanspaces.com/public/"
DatabaseConnection.connect
run Application