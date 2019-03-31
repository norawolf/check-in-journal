class EntriesController < ApplicationController

  get '/entries/new' do
    @moods = Mood.all
    @activities = Activity.all
    erb :'/entries/new'
  end

  post '/entries' do
    binding.pry
  end
end
