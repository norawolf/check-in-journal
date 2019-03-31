class EntriesController < ApplicationController

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
  end

  
end
