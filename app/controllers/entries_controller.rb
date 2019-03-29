class EntriesController < ApplicationController

  get '/entries/new' do
    erb :'/entries/new'
  end
end
