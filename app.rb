require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space_repository'
require_relative 'lib/booking_repository'
require_relative 'lib/user_repository'
require_relative 'lib/user'
require_relative 'lib/database_connection.rb'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/booking_repository'
    also_reload 'lib/space_repository'
  end
  configure do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/booking_repository'
    also_reload 'lib/space_repository'
  end
  enable :sessions
  get '/' do
    return erb(:home)
  end

  # Login route
  get '/login' do
    return erb(:login)
  end

  post '/login' do
    repo = UserRepository.new
    user = repo.get_user_from_email(params[:email_address])
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect("/spaces")
    else
      erb(:login)
    end
  end
  # get '/sessions/newn/new_session' do
  #   return erb(:spaces)
  # end
  post '/sessions/destroy' do
    session[:user_id] = nil
    redirect '/'
  end
  # Spaces
  get '/spaces' do
    repo = SpaceRepository.new
    @spaces_list = repo.all
    return erb(:spaces)
  end

  get '/spaces/:id' do
    repo = SpaceRepository.new
    id = params[:id]
    @space = repo.find(id)
    @dates = @space.dates_available.split(",")
    return erb (:space)
  end

  # Users
  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    if invalid_request_parameters?
      status 400
      return ''
    end
    # Users
  end
  post '/users' do
    repo = UserRepository.new
    new_user = User.new
    new_user.email_address = params[:email_address]
    new_user.password = params[:password]
    new_user.username = params[:username]
    new_user.first_name = params[:first_name]
    new_user.last_name = params[:last_name]
    new_user.user_created_date = DateTime.now
repo.create(new_user)
    user = repo.get_user_from_email(params[:email_address])
    session[:user_id] = user.id
    redirect '/spaces'
  end
    # Bookings Routes
  get '/bookings' do
    repo = SpaceRepository.new
    @space = repo.find(params[:space_id])
    return erb(:booking)
  end
  post '/bookings' do
    repo = BookingRepository.new
    repo.create(params[:space_id], params[:date])
    redirect '/spaces'
  end

  # def invalid_request_parameters?
  #   params[:first_name] == "" || params[:last_name] == "" || params[:username] == "" || params[:email_address] == "" || params[:password] == ""
  # end

end