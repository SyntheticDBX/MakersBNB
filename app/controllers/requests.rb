# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/reloader'
class Requests < Sinatra::Base
  register Sinatra::Reloader
  configure :development do
    set :views, "app/views/requests"
    set :public_dir, "public"
  end
  path = "/requests"
  get path do
    return erb(:index)
  end
end