require 'user'
require 'user_repository'
require 'database_connection'

RSpec.describe userRepository do

  def reset_tables
    seed_sql = File.read('spec/seeds_shop_manager.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  it "returns all users" do
    repo = userRepository.new
    users = repo.all
    expect(users.length).to eq(5)
    expect(users.first.id).to eq(1)
    expect(users.first.username).to eq('')
    expect(users.first.email_address).to eq()
  end

  it "returns the single user when searched by id  " do 
    repo = userRepository.new
    user = repo.find(2)
    expect(user.id).to eq(2)
    expect(user.username).to eq('')
    expect(user.email_address).to eq('')
  end

  
  it "creates users" do 
        user = User.new()
        repo = UserRepository.new
       
        user.username = ''
        user.email_address = 16
        user.forename = ''
        user.surname = ''
        user.username = ''
        

        user.unit_price = 14
        repo.create(user)
        expect(repo.all[-1].username).to eq('')
  
  end
end
