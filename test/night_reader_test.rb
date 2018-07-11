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
    assert_equal "Created '#{ARGV[1]}' containing #{"string".length} characters.", @translator.print_message("string")
  end

  def test_it_can_read_from_file_and_store_in_string
    input_string = @translator.read_from_file()
    assert_equal "abc", input_string
  end

  def test_it_has_a_dictionary
    assert_equal "a", @alphabet.braille_to_english[["0.", "..", ".."]]
  end

  def test_it_can_translate_single_braille_letter_to_english
    assert_equal "a", @alphabet.translate[["0.", "..", ".."]]
  end
end
