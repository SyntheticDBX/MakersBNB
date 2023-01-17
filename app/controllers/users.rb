# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
class Users < Sinatra::Base
  register Sinatra::Reloader
  configure :development do
    set :views, "app/views/users"
    set :public_dir, "public"
  end
  path = "/users"
  get path do
    return erb(:index)
  end
end


