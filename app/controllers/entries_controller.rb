class EntriesController < ApplicationController
  get '/entries' do
    if logged_in?
      @entries = current_user.entries
      erb :'/entries/entries'
    else
      redirect "/login"
    end
  end

  get '/entries/new' do
    @moods = Mood.all
    @activities = Activity.all
    erb :'/entries/new'
  end

  post '/entries' do
    @entry = Entry.new(date: params[:entry][:date], note: params[:entry][:note],
      user_id: session[:user_id])
    params[:entry][:moods].each do |mood|
      @entry.moods << Mood.find_or_create_by(name: mood)
    end
    params[:entry][:activities].each do |activity|
      @entry.activities << Activity.find_or_create_by(name: activity)
    end
    @entry.save

    redirect "/entries/#{@entry.id}"
  end

  get '/entries/:id' do
    #right now, if you manually try to go to an entries/:id that does not
    #exist, it throws and error, so:
    # if !Entry.all.include?(params[:id])
    #   redirect "/entries"
    # end

    @entry = Entry.find(params[:id])
    #ensure that a user can only view their own entries
    if logged_in? && @entry.user_id == current_user.id
      erb :'/entries/show'
    else
    #  include a "you do not have access to that entry"
      redirect "/entries"
    end
  end

  get '/entries/:id/edit' do
    @entry = Entry.find(params[:id])
    @moods = Mood.all
    @activities = Activity.all

    if logged_in? && @entry.user_id == current_user.id
      erb :'/entries/edit'
    else
      # error message - "you can only edit your own entries"
      redirect "/entries"
    end
  end

  patch '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.date = params[:entry][:date]
    @entry.note = params[:entry][:note]

    # params[:entry][:moods].each do |mood|
    #   if !params["pet"]["name"].empty?
    #     @entry.moods << Mood.find_or_create_by(name: mood)
    #   end
    # end

    # params[:entry][:activities].each do |activity|
    #   if !@entry.activities.include?(activity)
    #     @entry.activities << Activity.find_or_create_by(name: activity)
    #   end
    # end
    @entry.save

    redirect to "/entries/#{@entry.id}"
  end

end
