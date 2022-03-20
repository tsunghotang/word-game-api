class AnagramSolver
  def initialize(letters)
    @letters = letters
  end

  def self.call(*args)
    new(*args).solve_anagram
  end

  def solve_anagram
    word_list = valid_words
    filter_words(word_list)
  end

  private

  def valid_words
    $words.select do |word|
      result = word.chars.all? do |letter|
        word.count(letter) <= @letters.count(letter)
      end
      word if result
    end
  end

  def filter_words(word_list)
    word_list.group_by(&:length).sort.to_h
  end

end
