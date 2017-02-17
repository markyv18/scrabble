gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_letter_multiply
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_word_multiply
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_7_letter_10_bonus
    game = Scrabble.new
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_find_highest_point_word
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])  # => "home"
  end

  def test_highest_word_fewest_letters
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])  # => "word"
  end

  def test_highest_word_seven_letters
    skip
    game = Scrabble.new
    assert_equal "silence", game.highest_scoring_word(['home', 'word', 'silence'])  # => "silence"
  end

  def test_highest_word_earliest_in_list
    skip
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hi', 'word', 'ward'])  # => "word"
  end

end
