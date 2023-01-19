 require_relative "../spec_helper"
 require "rack/test"
 require_relative '../../app'
 require 'json'

 describe Application do
   # This is so we can use rack-test helper methods.
   include Rack::Test::Methods

   # We need to declare the `app` value by instantiating the Application
   # class so our tests work.
   let(:app) { Application.new }

   # Write your integration tests below.
   # If you want to split your integration tests
   # accross multiple RSpec files (for example, have
   # one test suite for each set of related features),
   # you can duplicate this test file to create a new one.

   context 'GET /' do
     xit 'displays homepage' do
       response = get('/')

       expect(response.status).to eq(200)
       expect(response.body).to include('Hash-it-out')
       expect(response.body).to include('Hash it out at our lovely studio in Central London!')
       expect(response.body).to include('123 Harley St')
       expect(response.body).to include('London')
       expect(response.body).to include('United Kingdom')
       expect(response.body).to include('£150')
     end
   end

   context 'GET /login' do
     xit 'displays login form' do
       response = get('/login')
       expect(response.status). to eq 200
       expect(response.body).to include 'Login'
     end
   end

   context 'GET /signup' do
     xit 'displays signup page' do
       response = get('/signup')
       expect(response.status).to eq 200
       expect(response.body).to include 'Signup'
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
       expect(response.body).to include('Zruč nad Sázavou')
       expect(response.body).to include('Czech Republic')
 
     end
   end
   context 'POST signup' do
     it 'should signup user' do
       response = post('/login',email:"claudina@email.com",password:"vCcbaj")
       # response = get('/sessions',email:"claudina@email.com",password:"vCcbaj")
       # expect(response.cookie("rack.session"))
       expect(response.status).to eq 200
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