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

   get '/template' do
    return erb(:template)
  end

   get '/spaces/new' do
    return erb(:new_listing)
  end

  get '/spaces' do
    repo = SpaceRepository.new

    @spaces_list = repo.all
    return erb(:spaces)
  end

  get '/spaces/:id' do
    repo = SpaceRepository.new
    id = params[:id]
    @space = repo.find(id)
    return erb(:space) 
  end

 

  get '/requests' do 
    return erb(:requests)
  end

  get '/login' do
    return erb(:login)
  end

  get '/signup' do
    return erb(:signup)
  end

end