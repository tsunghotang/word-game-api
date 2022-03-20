class WordsController < ApplicationController
  def home
    render json: {
      endpoints: [
        'https://countdown-word-game-api.herokuapp.com/:word',
        'https://countdown-word-game-api.herokuapp.com/solve/:letters'
      ]
    }
  end

  def query
    word = params[:word].downcase

    response =
      if $words.include?(word)
        { valid: true, word: word, length: word.length }
      else
        { valid: false, word: word, error: 'word not found' }
      end
    render json: response
  end

  def solve
    letters = params[:letters].downcase
    valid_words = AnagramSolver.call(letters)
    offset = calc_offset

    response = valid_words.values.last(offset).flatten.reverse.map do |word|
      conumdrum = word.length == 9
      { word: word, length: word.length, conumdrum: conumdrum }
    end
    render json: response
  end

  private

  def calc_offset
    variance = params[:variance].to_i
    variance.present? && variance.negative? ? 9 : variance + 1
  end
end
