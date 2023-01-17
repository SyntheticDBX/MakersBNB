require 'user'

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
      user.email_adress = record['email_address']
      user.password = record['password']
      user.username = record['username']
      user.user_created_date = record['user_created_date']

      users << user
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
    user.email_adress = record['email_address']
    user.password = record['password']
    user.username = record['username']
    user.user_created_date = record['user_created_date']
    return user
  end 

  def create(user)
    
    sql = 'INSERT INTO users(first_name, last_name, email_address, password, username, user_created_date) VALUES($1, $2, $3, $4, $5, $6);'
    sql_params = [user.first_name, user.last_name, user.email_address, user.password, useruser.username, user.user_created_date]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end 

end 
