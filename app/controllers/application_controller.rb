# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/reloader'
class ApplicationController < Sinatra::Base
  configure :development do
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    return erb(:index)
  end
end