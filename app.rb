
require 'pg'
require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'lib/database_connection'

require_relative 'lib/user'
require_relative 'lib/space'
require_relative 'lib/booking'

require_relative 'lib/user_repository'
require_relative 'lib/space_repository'
require_relative 'lib/booking_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    
    also_reload 'lib/space_repository'
    enable :sessions
  end


  get '/foo' do
    session[:message] = 'Hello World!'
    redirect to('/bar')
  end

  get '/bar' do
    session[:message]   # => 'Hello World!'
  end
  get '/spaces' do
    return erb(:spaces)
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
    return erb(:home)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    return erb(:spaces)
  end

  get '/requests' do 
    return erb(:requests)
  end
end