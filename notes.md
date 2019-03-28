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
