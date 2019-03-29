require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  # define helpers for logged_in and current_user here
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
     !!current_user
  end
end
