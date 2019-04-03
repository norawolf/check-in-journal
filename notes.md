CURRENTLY WORKING ON:
make edit page match new.erb formatting

STILL NOT WORKING
- for entries/:id and entries/:id/edit -- working on controlling so a user can't manually
    enter a entry that doesn't exist or has been deleted to avoid an active record error.
    need a case for them being logged_in and when they are not logged in

- ADD TIME in 12 hour format to entry show page
layout, css, page checks and indentations
- make edit entry page identical to create new entry page
  - add "cancel edit" to edit entry page
  - add "nevermind, back to dashboard" to new page

- Add insights to dashboard
  https://docs.google.com/spreadsheets/d/10fACQt8WISQdE05fCdGxgw2hNDabY0VMoQ8KCccCRAg/edit#gid=0

COMPLETED: index, signup, dashboard, entries all show, create new entry

- HTML validations
- new and edit seem to be working
    - test if they can work without the validations in the models
        VS.
    - test to see if they work without the if !mood.empty? etc statement
https://apidock.com/rails/ActionView/Helpers/FormOptionsHelper/select

or can try the bug fix from the pets/owners complex forms lab

REFACTOR:
- EXTRACT the new/edit find or create by mood and activity iterations into HELPER METHODS to call!!

UP NEXT:
- Make sure a user can only access their own content
- Navigation between pages / option to logout often
- Layout fun!
- Add insights: any data summaries? X moods over last 30 days. most done activities, etc?

REACH GOALS:
- Add Sinatra Flash
- Add JQuery Chosen gem (can it be used in sinata)? for moods selector list
  https://harvesthq.github.io/chosen/
  https://stackoverflow.com/questions/12498399/using-chosen-plugin-with-rails-select
  https://github.com/ezgraphs/jquery-sinatra-demo/blob/master/views/index.erb
  https://stackoverflow.com/questions/5811723/how-to-provide-jquery-support-in-sinatra


OUTLINE:
User Can:
  - Sign Up -- COMPLETE 3/28
    - After sign up, redirects to user dashboard page -- COMPLETE 3/28
  - Log In
    - redirects to user dashboard
  - Create a new entry # update date field in table to DateTime!
  - Edit a past entry
  - Delete a past entry
  - See all their own entries

User Cannot:
  - see other users' entries
  - modify or delete other users' entries

Needed views
- Dashboard Page - specific to user ID
  - welcomes user (and "your last entry was on")
  - option to create new entry
  - or browse past entries
  - or log out




--------------
notes from 1:1 w Z

 entry[mood][][severity] = "medium"

 https://www.w3schools.com/tags/tag_select.asp 
  Iterate through moods to display in select list

  # moods = [{name: "anxious", severity: "mild"}, {name: "calm", severity: "medium"}]

    moods = ["anxious", "calm"]

#make sure form name attributes are structured correctly for moods and activities
  <input type"" name="entry[mood][]">
  #with hash <input type"" name="entry[mood][][severity]">

# while creating objects
# also do association

entry1 = Entry.new(date: "today", note: "test", user_id: 1)
  => #<Entry id: nil, date: "today", note: "test", user_id: 1, created_at: nil, updated_at: nil>


activities = ["run", "meditate", "work"]
  => ["run", "meditate", "work"]

# options to expand, to allow moods to have :severity and
# activities to have a :duration

  moods.each do |mood|
    entry1.moods << Mood.find_or_create_by(name: mood)
  end

  activities.each do |activity|
    entry1.activities << Activity.find_or_create_by(name: activity)
  end

entry1.save   # at end, in case of

# try in DB Browser
