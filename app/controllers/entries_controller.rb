class EntriesController < ApplicationController

  get '/entries/new' do
    @moods = Mood.all

    erb :'/entries/new'
  end

  post '/entries' do
    binding.pry
  end
end
