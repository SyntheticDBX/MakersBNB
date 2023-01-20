require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space_repository'
require_relative 'lib/booking_repository'
require_relative 'lib/user_repository'
require_relative 'lib/user'
require_relative 'lib/booking'
require_relative 'lib/space'
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

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    user = User.new(params)
    user.authenticate
    if user
      session[:user_id] = user.id
      redirect("/spaces")
    else
      erb(:login)
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/spaces' do
    repo = SpaceRepository.new
    @spaces_list = repo.all
    return erb(:spaces)
  end

  get '/spaces/new' do
    return erb(:new_listing)
  end

  get '/spaces/:id' do
    repo = SpaceRepository.new
    id = params[:id]
    @space = repo.find(id)
    @dates = @space.dates_available.split(",")
    return erb (:space)
  end



  get '/booking-requests' do
    return erb(:requests)
  end

  get '/login' do
    return erb(:login)
  end

  post '/spaces' do
    return erb (:space)
  end
  # Users
  get '/signup' do
    return erb(:signup)
  end

  post '/users' do
    if invalid_request_parameters?
      status 400
      return ''
    end

     user = User.new(params)
     user = user.signup(params)
    session[:user_id] = user.id
    redirect '/spaces'

    def invalid_request_parameters?
      params[:first_name] == "" || params[:last_name] == "" || params[:username] == "" || params[:email_address] == "" || params[:password] == ""
    end
  end
  # Bookings Routes
  get '/bookings' do
    repo = BookingRepository.new
    @bookings_list = repo.all
    return erb(:bookings)
  end

  post '/bookings' do
    repo = BookingRepository.new
    repo.create(params[:space_id])
    #TODO Add bookings model
    redirect '/spaces'
  end

  # def invalid_request_parameters?
  #   params[:first_name] == "" || params[:last_name] == "" || params[:username] == "" || params[:email_address] == "" || params[:password] == ""
  # end

end