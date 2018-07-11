require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"
require "./lib/braille_to_english_alphabet"
require "./lib/braille_to_english_translator"

class NightReaderTest < Minitest::Test

  def setup
    @translator = Translator.new
    @alphabet = BrailleToEnglishAlphabet.new
  end

  def test_it_exists
    assert_equal Translator, @translator
    assert_equal BrailleToEnglishAlphabet, @alphabet
  end

  def test_it_prints_message_to_terminal
  end
end
