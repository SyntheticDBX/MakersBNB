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
    booking_repo = BookingRepository.new
    space_repo = SpaceRepository.new
    @sent = booking_repo.find_by_user_id(session[:user_id])
    host_spaces = space_repo.find(session[:user_id])
    @received = [ ]
    host_spaces.each do |space|
      space_requests = booking_repo.find_by_space_id(space.id)
      space_requests.each do |request|
        @received << request
      end
    end
    return erb(:bookings)
  end

  post '/reject' do
    bookingid = params[:id]
    booking_repo = BookingRepository.new
    booking_repo.delete(:bookingId)
  end

  post '/accept' do
    date_requested = params[:date_requested]
    space_repo = SpaceRepository.new
    space = space_repo.find(:id)
    current_available = space.dates_available
    new_available = current_available.delete(date_requested)
    space.dates_available = new_available
    space_repo.update(space)

    booking = booking_repo.find(:id)
    booking.booking_approved? = true
    booking_repo.update(booking)
  end

  post '/bookings' do
    repo = BookingRepository.new
    
    range = (params[:start_date])..(params[:end_date]).to_a.join(",")
    space = Space.new
    space.dates_available = range
    # Other space params
    space_repo.create(space)
    #TODO Add bookings model
    redirect '/spaces'
  end

  # def invalid_request_parameters?
  #   params[:first_name] == "" || params[:last_name] == "" || params[:username] == "" || params[:email_address] == "" || params[:password] == ""
  # end

end