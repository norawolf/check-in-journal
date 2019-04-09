require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "yarrowyarrowyarrow"
  end

  get "/" do
    if current_user
      redirect "/dashboard"
    else
      erb :index
    end
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
