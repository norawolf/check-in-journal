class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    # validate username, email, and password
    # if successful
      # save user
      # log user in by creating session[:user_id]
      # redirect to dashboard page
    # if not successful
      # redirect to signup page
    @user = User.new(params)

    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/dashboard'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    #validate username and password
    # if successful
    # log user in by creating session[:user_id]
    # redirect to dashboard page
    # else
    # redirect to /login again
    @user = User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      redirect '/login'
    end

  end

  get '/dashboard' do
    erb :'/users/dashboard'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
