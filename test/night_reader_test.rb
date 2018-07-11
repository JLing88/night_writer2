require "minitest/autorun"
require "minitest/pride"
require "./lib/night_reader"
require "./lib/braille_to_english_alphabet"
require "./lib/braille_to_english_translator"

class NightReaderTest < Minitest::Test

  def setup
    @translator = Translator.new(ARGV[0], ARGV[1])
    @alphabet = BrailleToEnglishAlphabet.new
  end

  def test_it_exists
    assert_instance_of Translator, @translator
    assert_instance_of BrailleToEnglishAlphabet, @alphabet
  end

  def test_it_prints_message_to_terminal
    assert_equal "Created 'original_message.txt' containing 256 characters.", @translator.print_message
  end
end
