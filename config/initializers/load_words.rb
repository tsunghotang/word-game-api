$words = HTTP.get('https://raw.githubusercontent.com/dwyl/english-words/master/words.txt').to_s.split("\n").map(&:downcase).uniq.freeze
