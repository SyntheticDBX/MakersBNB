require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space_repository'
require_relative 'lib/booking_repository'

require_relative 'lib/database_connection.rb'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload  'lib/user_repository'
    also_reload  'lib/booking_repository'
    also_reload  'lib/space_repository'
  end

  get '/' do
    return erb(:home)
  end

  # get '/spaces' do
  #   repo = SpaceRepository.new

  #   @spaces_list = repo.all
  #   return erb(:spaces)
  # end

  # get '/spaces/:id' do
  #   repo = SpaceRepository.new
  #   id = params[:id]
  #   @space = repo.find(id)
  #   @dates = @space.dates_available#.split(",")
  #   return erb(:space) 
  # end

  # get '/signup' do
  #   return erb(:signup)
  # end

  get '/spaces' do
    repo = SpaceRepository.new
    @spaces_list = repo.all
    return erb (:spaces)
  end

  get '/spaces/:id' do
    repo = SpaceRepository.new
    @space = repo.find(params[:id])
    @dates = @space.dates_available.split(",")
    return erb(:space)
  end

  get '/sessions/new' do
    return erb(:login)
  end

  post '/sessions' do
    repo = UserRepository.new
    user = repo.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      return erb(:login)
    end
  end
  
  
  post '/sessions/destroy' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/users/new' do
    return erb(:signup)
  end

  post '/users' do
    repo = UserRepository.new
    user = repo.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/spaces'
  end

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


end