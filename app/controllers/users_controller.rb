class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    # validate username, email, and password
    # if successful
      # create and save user
      # log user in by creating session[:user_id]
      # redirect to landing page
    # if not successful
      # redirect to signup page
      
  end

end
