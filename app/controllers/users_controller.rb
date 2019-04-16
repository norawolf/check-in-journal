class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(params)

    if @user.save
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      flash[:user_error] = "Your information was not valid. Please try again."
      redirect '/signup'
    end
  end

  get '/login' do
    if current_user
      redirect '/dashboard'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/dashboard'
    else
      flash[:user_error] = "Your information was not valid. Please try again."
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
