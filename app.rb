require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space_repository'
require_relative 'lib/booking_repository'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection.rb'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload  'lib/user_repository'
    also_reload  'lib/booking_repository'
    also_reload  'lib/space_repository'
  end
  configure  do
    register Sinatra::Reloader
    also_reload  'lib/user_repository'
    also_reload  'lib/booking_repository'
    also_reload  'lib/space_repository'
  end
  enable :sessions
  get '/' do
    return erb(:home)
  end


  #Login route
  get '/login' do
    return erb(:login)
  end

  post '/login' do
    email = params[:email_address]
    password = params[:password]
    repo = UserRepository.new
    user = repo.authenticate(email, password)
    if user.password == params[:password]
      print "Password passed"
      session[:user_id] = user.id
      redirect("/spaces")
    else
      print "Password not worked"
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
  #Spaces
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

  #Users
  get '/users/new' do
    return erb(:signup)
  end

  post '/signup' do
    if invalid_request_parameters?
      status 400
      return ''
    end
  post '/users' do
    repo = UserRepository.new
    user = repo.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

  #Bookings Routes
  get '/bookings/new' do
    repo = SpaceRepository.new
    @space = repo.find(params[:space_id])
    return erb(:booking)
  end

  post '/bookings' do
    repo = BookingRepository.new
    repo.create(params[:space_id], params[:date])
    redirect '/spaces'
  end


    repo = UserRepository.new
    user = User.new
    user.first_name = params[:first_name]
    user.last_name =  params[:last_name]
    user.username = params[:username]
    user.email_address = params[:email_address]
    user.password = params[:password]
    user.user_created_date = DateTime.now
    repo.create(user)
    redirect '/spaces'
  end

  # def invalid_request_parameters?
  #   params[:first_name] == "" || params[:last_name] == "" || params[:username] == "" || params[:email_address] == "" || params[:password] == ""
  # end



end