require_relative 'user'
require_relative '../lib/database_connection'
require 'bcrypt'

class UserRepository

  def all
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.map {| user_hash | User.new(user_hash)}
  end
  #
  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    result_set.map { | user_hash | User.new(user_hash)}.first
  end

  def find_by_email(email_address)
    sql = 'SELECT * FROM users WHERE email_address = $1;'
    sql_params = [email_address]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    result_set.map { | user_hash | User.new(user_hash)}.first
  end
  def create(user_hash)
    user = User.new(user_hash)
    sql = 'INSERT INTO users (first_name, last_name, email_address, password, username, user_created_date) VALUES($1, $2, $3, $4, $5, $6);'
    sql_params = [user.first_name, user.last_name, user.email_address, user.password, user.username, user.user_created_date]
    DatabaseConnection.exec_params(sql, sql_params).to_a.first
  end


end 
