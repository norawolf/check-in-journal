Functionality To Build

SCRAPING QUESTIONS
- Where should Scraper class live
- Can Scraper inherit from ActiveRecord base?


UP NEXT:
- Build Login functionality
- Add scraper for moods to seeds.rb
- Then, seed database with a few activities and moods
- Build "create a new entry" form


Reach Goals:
- Add Sinatra Flash login
- Add JQuery Chosen gem (can it be used in sinata)? for moods selector list
  https://harvesthq.github.io/chosen/
  https://stackoverflow.com/questions/12498399/using-chosen-plugin-with-rails-select
  https://github.com/ezgraphs/jquery-sinatra-demo/blob/master/views/index.erb
  https://stackoverflow.com/questions/5811723/how-to-provide-jquery-support-in-sinatra
  
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

- Create entry
- Edit entry (also with delete button)

Needed Features
  - session
  - use ActiveRecord Validations https://guides.rubyonrails.org/active_record_validations.html

Later On:
- Entry, Moods, and Activities Logic
- Use Find or Create By as mentioned below



--------------
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
