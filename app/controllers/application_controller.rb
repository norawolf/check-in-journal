require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "yarrowyarrowyarrow"
    # this recommended line from sinatra docs wasn't working, did not save added
    # session variables across routes?
    # set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  end

  get "/" do
    erb :index
  end

  # define helpers for logged_in and current_user here
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
     !!session[:user_id]
  end
  
end
