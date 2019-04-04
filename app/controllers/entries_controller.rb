class EntriesController < ApplicationController
  get '/entries' do
    if logged_in?
      @entries = current_user.entries
      erb :'/entries/entries'
    else
      halt erb(:error_login)
    end
  end

  get '/entries/new' do
    # is it okay to overwrite Mood.all in the model to add the sort by name instead of repeating
    # in the edit method?
    @moods = Mood.all.sort_by(&:name)
    @activities = Activity.all.sort_by(&:name)
    erb :'/entries/new'
  end

  post '/entries' do
    @entry = Entry.new(date: params[:entry][:date], note: params[:entry][:note],
      user_id: session[:user_id])

    check_collection_for_empty_string_and_create_objects
    @entry.save

    redirect "/entries/#{@entry.id}"
  end

  get '/entries/:id' do
    #if you manually try to go to an entries/:id that does not yet exist or has
    # been deleted from the database, it throws and error still
    #DRY - refactor into helper method
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
    @moods = Mood.all.sort_by(&:name)
    @activities = Activity.all.sort_by(&:name)

    if logged_in? && @entry.user_id == current_user.id && @entry.id
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
    @entry.moods = []
    @entry.activities = []
    # only way i've found is to reset @entry.moods, and then repopulate.
    # is there a better way?
    # if a box gets unchecked, it is still in the params array as an empty string
    check_collection_for_empty_string_and_create_objects


    @entry.save
    redirect to "/entries/#{@entry.id}"
  end

  delete '/entries/:id/delete' do
    @entry = Entry.find(params[:id])
    @entry.delete
    redirect to '/entries'
  end

  def check_collection_for_empty_string_and_create_objects
    params[:entry][:moods].each do |mood|
      if !mood.empty?
        @entry.moods << Mood.find_or_create_by(name: mood)
      end
    end
    params[:entry][:activities].each do |activity|
      if !activity.empty?
        @entry.activities << Activity.find_or_create_by(name: activity)
      end
    end
  end

end
