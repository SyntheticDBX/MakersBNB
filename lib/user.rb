
class User
  attr_accessor :id, :first_name, :last_name, :email_address, :password, :username, :user_created_date

  def initialize(user_hash)
@id = user_hash['id'].to_i
@first_name = user_hash['first_name']
@last_name = user_hash['last_name']
@email_address = user_hash['email_address']
@password = user_hash['password']
@username = user_hash['username']
@user_created_date = user_hash['user_created_date'] || DateTime.now
  end

  def authenticate(email_address)
    user_repo = UserRepository.new
    user = user_repo.find_by_email(email_address)
    self.initialize(user)
    if user
      user.password == @password
    else
      false
    end
  end

  def signup(params)
    repo = UserRepository.new
    repo.create(params)
    return self
  end


  def stringify_keys(hash)
    hash.map do |k,v|
      v_str = if v.instance_of? Hash
                v.stringify_keys
              else
                v
              end

      [k.to_s, v_str]
    end
    Hash[h]
  end

end 