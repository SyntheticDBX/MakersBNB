 require_relative "../spec_helper"
 require "rack/test"
 require_relative '../../app'
 require 'json'

 def reset_seeds_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
  connection.exec(seed_sql)
end

 describe Application do
   # This is so we can use rack-test helper methods.
   include Rack::Test::Methods

   # We need to declare the `app` value by instantiating the Application
   # class so our tests work.
   let(:app) { Application.new }

   before(:each) do
    reset_seeds_table
  end

   # Write your integration tests below.
   # If you want to split your integration tests
   # accross multiple RSpec files (for example, have
   # one test suite for each set of related features),
   # you can duplicate this test file to create a new one.

   context 'GET /' do
     it 'displays homepage' do
       response = get('/')

       expect(response.status).to eq(200)
       expect(response.body).to include('Share Your Space')
     end
   end

   context 'GET /login' do
     it 'displays login form' do
       response = get('/login')
       expect(response.status). to eq 200
       expect(response.body).to include 'Log In'
     end
   end

   context 'GET /signup' do
     it 'displays signup page' do
       response = get('/signup')
       expect(response.status).to eq 200
       expect(response.body).to include "<form action='/users' method='POST' class>"
     end
   end

   context 'POST /users' do
      it 'redirects to list of spaces' do
        response = post('/users', first_name: "John", last_name: "Smith", email_address: "john@email.com", password: "efaAS4d", username: "jsm1th10", user_created_date: '2023-01-19')
        expect(response.status).to eq 302
        repo = UserRepository.new
        users = repo.all

        expect(users).to include(
          have_attributes(
            first_name: "John", 
            last_name: "Smith", 
            email_address: "john@email.com", 
            password: "efaAS4d", 
            username: "jsm1th10", 
            user_created_date: '2023-01-19'
          )
        )
      end
   end

   context 'GET spaces/' do
     it 'displays all spaces' do
       response = get('/spaces')
       expect(response.body).to include 'Cottage house' 
      end
    end
    
   context 'GET spaces/:id' do
     it 'displays space ID 2s page' do
       response = get('/spaces/2')
       expect(response.status).to eq 200
       expect(response.body).to include('Treehouse')
     end
   end

 #   context 'GET space/' do
 #     it 'displays space ID 2s page' do
 #       response = get('/spaces')
 #
 #       print response
 #      # expect(response.status).to eq 200
 #      # expect(response.body).to include('Not-dodgy mattress')
 #      # expect(response.body).to include('321 Denmark Street')
 #      # expect(response.body).to include('Birmingham')
 #      # expect(response.body).to include('United Kingdom')
 #    end
 #  end
 #
 #   context 'POST /login' do
 #     response = post('/login', email: "user@makersbnb.com", password: "CorrectPassword123")
 #     expect(response.status).to eq 302 # Status 302 provides temporary access (I could be wrong)
 #   end
 #
 # end
  end