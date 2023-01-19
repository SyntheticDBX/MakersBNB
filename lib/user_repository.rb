require_relative 'user'
require_relative '../lib/database_connection'
require 'bcrypt'

class UserRepository

  def all
    users = []
    sql = "SELECT * FROM users;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.first_name = record['first_name']
      user.last_name = record['last_name']
      user.email_address = record['email_address']
      user.password = record['password']
      user.username = record['username']
      user.user_created_date = record['user_created_date']

      users << user
    end

    return users
  end

  def find(id)
    sql = 'SELECT * FROM users WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    user = User.new
    user.id = record['id'].to_i
    user.first_name = record['first_name']
    user.last_name = record['last_name']
    user.email_address = record['email_address']
    user.password = record['password']
    user.username = record['username']
    user.user_created_date = record['user_created_date']

    return user
  end

  def create(user)

    sql = 'INSERT INTO users (first_name, last_name, email_address, password, username, user_created_date) VALUES($1, $2, $3, $4, $5, $6);'
    sql_params = [user.first_name, user.last_name, user.email_address, user.password, user.username, user.user_created_date]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def authenticate(email_address, password)
    sql = 'SELECT * FROM users WHERE email_address = $1;'
    sql_params = [email_address]
    result_set = DatabaseConnection.exec_params(sql, sql_params).to_a.first
    return unless result_set.any?
    # return unless BCrypt::Password.new(result_set[0]['password']) == password
    return unless result_set['password'] == password
    new_user = User.new
    new_user.id = result_set['id']
    new_user.first_name = result_set['first_name']
    new_user.last_name = result_set['last_name']
    new_user.email_address = result_set['email_address']
    new_user.password = result_set['password']
    new_user.username = result_set['username']
    new_user.user_created_date = result_set['user_created_date']
    return new_user
  end
end 
