require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/space_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload  'lib/user_repository'
    also_reload  'lib/booking_repository'
    also_reload  'lib/space_repository'
  end

  get '/' do
    return erb(:index)
  end
  get '/spaces' do
    repo = SpaceRepository.new

    @spaces_list = repo.find(2).name

    return erb (:spaces)
  end
end