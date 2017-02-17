class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    @x = 0
    word.upcase.chars.each_with_index do |letter, index|
      @x += point_values[letter] * letter_multiplier[index]
    end
    @x += 10 if word.length == 7
    return @x * word_multiplier
  end

  def highest_scoring_word(arr_words)
    scores = arr_words.map do |word|
      score(word)
    end
    high_array = arr_words.zip(scores)

    high_hash = Hash[arr_words.zip scores]

    y = high_hash.sort_by do |_key, value|
      value
    end
require "pry"; binding.pry


    x = high_hash.max_by do |k,v|
      v
    end
    x[0]
    require "pry"; binding.pry
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end
end
Scrabble.new.highest_scoring_word(['hello', 'word', 'sound'])
