require 'user'
require 'user_repository'
require 'database_connection'

RSpec.describe UserRepository do

  def reset_users_table
    seed_sql = File.read('spec/user_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
    connection.exec(seed_sql)
  end


  before(:each) do
    reset_users_table
  end

  it "returns all users" do
    repo = UserRepository.new
    users = repo.all
    
    expect(users.length).to eq(5)
    expect(users.first.id).to eq(1)
    expect(users.first.username).to eq('cautin0')
    expect(users.first.email_address).to eq('claudina@email.com')
  end

  it "returns the single user when searched by id" do 
    repo = UserRepository.new
    user = repo.find(2)
    expect(user.id).to eq(2)
    expect(user.username).to eq('nconibeer1')
    expect(user.email_address).to eq('noelle@email.com')
  end

  
  it "creates a new user" do 
        
        repo = UserRepository.new
       
        new_user = User.new()
        new_user.first_name = 'Ehijie'
        new_user.last_name = 'Aghedo'
        new_user.username = 'ehijie98'
        new_user.email_address = 'ehijie@email.com'
        new_user.password = 'fGaf92s'
        new_user.user_created_date = '2022-08-13'
      
        repo.create(new_user)

        expect(repo.all).to include(
          have_attributes(
            id: 6,
            first_name: 'Ehijie',
            last_name: 'Aghedo',
            username: 'ehijie98',
            email_address: 'ehijie@email.com',
            password: 'fGaf92s',
            user_created_date: '2022-08-13'
          )
        )    
  end
end
