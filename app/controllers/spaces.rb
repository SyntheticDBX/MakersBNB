# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/reloader'
class Spaces < Sinatra::Base
  register Sinatra::Reloader
  configure :development do
    # set :views, "app/views/spaces"
    set :public_dir, "public"
  end
  path = "/spaces"
  get path do
    return erb(:index)
  end
end