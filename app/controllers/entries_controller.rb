class EntriesController < ApplicationController
  get '/entries' do
    if current_user
      @entries = current_user.entries
      erb :'/entries/entries'
    else
      halt erb(:error_not_logged_in)
    end
  end

  get '/entries/new' do
    if current_user
      @moods = Mood.all.sort_by(&:name)
      @activities = Activity.all.sort_by(&:name)
      erb :'/entries/new'
    else
      halt erb(:error_not_logged_in)
    end
  end

  post '/entries' do
    moods = params[:entry][:moods]
    activities = params[:entry][:activities]
    entry = Entry.new(date: params[:entry][:date], note: params[:entry][:note],
      user_id: session[:user_id])
    entry.check_collection_for_empty_string_and_create_objects(moods, activities)
    entry.save
    redirect "/entries/#{entry.id}"
  end

  get '/entries/:id' do
    @entry = Entry.find_by_id(params[:id])

    if logged_in? && @entry && @entry.user_id == current_user.id
      erb :'/entries/show'
    else
      halt erb(:error_entries)
    end
  end

  get '/entries/:id/edit' do
    @entry = Entry.find_by_id(params[:id])
    @moods = Mood.all.sort_by(&:name)
    @activities = Activity.all.sort_by(&:name)

    if @entry.nil?
      redirect "/entries"
    elsif current_user && @entry.user_id == current_user.id && @entry.id
      erb :'/entries/edit'
    else
      halt erb(:error_entries)
    end
  end

  patch '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.date = params[:entry][:date]
    @entry.note = params[:entry][:note]
    @entry.moods = []
    @entry.activities = []
    check_collection_for_empty_string_and_create_objects
    @entry.save
    redirect to "/entries/#{@entry.id}"
  end

  delete '/entries/:id' do
    @entry = Entry.find(params[:id])
    if logged_in? && @entry && @entry.user_id == current_user.id
      @entry.delete
      redirect to '/entries'
    else
      halt erb(:error_entries)
    end
  end

end
