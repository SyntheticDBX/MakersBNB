require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space'
require_relative 'lib/space_repository'
require 'lib/user'
require 'lib/user_repository'
require 'lib/booking'
require 'lib/booking_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    return erb(:home)
  end

  get '/signup' do
    return erb(:signup)
  end

  def invalid_request_parameters?
    params[:first_name] == nil || params[:last_name] == nil || params[:username] == nil || params[:email] == nil || params[:password] == nil
  end

  post '/signup' do
    if invalid_request_parameters? 
      status 400
      return ''
    end

    repo = UserRepository.new
    user = User.new
    user.first_name = params[:first_name]
    user.last_name =  params[:last_name]
    user.email = params[:email]
    user.password = params[:password]
    user.username = params[:username]
    user.user_created_date = DateTime.now
    repo.create(user)
    return erb(:spaces)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    return erb(:spaces)
  end

  get '/spaces' do
    repo = SpaceRepository.new
    @spaces = repo.all
    return erb(:spaces)
  end

  post '/spaces' do
    return erb(:spaces)
  end

  post '/spaces/:id' do
    
  end

  get '/requests' do 
    return erb(:requests)
  end

end