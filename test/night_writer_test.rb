require "minitest/autorun"
require "minitest/pride"
require "./lib/night_writer"
require "./lib/english_to_braille_alphabet"
require "./lib/english_to_braille_translator"

class NightWriterTest < Minitest::Test

  def setup
    @alphabet = EnglishToBrailleAlphabet.new
    @translator = Translator.new(ARGV[0], ARGV[1])
  end

  def test_it_exists
    assert_instance_of EnglishToBrailleAlphabet, @alphabet
    assert_instance_of Translator, @translator
  end

  def test_it_prints_correct_filename_and_count_in_message
    @translator.read_from_file
    assert_equal "Created 'output.txt' containing 2 characters", @translator.print_message("ab")
  end

  def test_it_can_translate_single_letter_to_braille_character
    assert_equal [@alphabet.alpha_to_braille["b"]], @translator.translate(["b"])
  end

  def test_it_can_translate_multiple_letters_to_braille_character
    assert_equal [@alphabet.alpha_to_braille["a"], @alphabet.alpha_to_braille["b"]], @translator.translate(["a", "b"])
  end

end
