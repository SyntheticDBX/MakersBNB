require 'sinatra/base'
require 'sinatra/reloader'
# require 'user'
# require 'user_repository'
# require 'date'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
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
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    user.email_verified = false
    user.user_created = DateTime.now
    repo.create(user)
    return erb(:login)
  end

  get '/login' do
    return erb(:login)
  end
end