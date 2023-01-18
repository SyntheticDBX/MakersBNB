require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/space_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/spaces' do
    repo = SpaceRepository.new

    space = repo.all

    return erb(:index)
  end
end