require 'open-uri'

MOODS = "https://www.vocabulary.com/lists/535865"

def get_page(url)
  Nokogiri::HTML(open(url))
end

all_moods = []
page = get_page(MOODS)
nodeset = page.css("a.word.dynamictext")

nodeset.each do |node|
  all_moods << {name: node.text}
end

all_moods.each do |hash|
  Mood.find_or_create_by(hash)
end
