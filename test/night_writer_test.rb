require "minitest/autorun"
require "minitest/pride"
require "./lib/night_writer"
require "./lib/braille_alphabet"
require "./lib/translator"
require "pry"

class NightWriterTest < Minitest::Test

  def setup
    @alphabet = BrailleAlphabet.new
    @translator = Translator.new(ARGV[0], ARGV[1])
  end

  def test_it_exists
    assert_instance_of BrailleAlphabet, @alphabet
    assert_instance_of Translator, @translator
  end

  def test_it_prints_correct_filename_and_count_in_message
    @translator.read_from_file
    assert_equal "Created 'output.txt' containing 2 characters", @translator.print_message("ab")
  end

  def test_it_can_single_letter_to_braille_character
    assert_equal [@alphabet.alpha_to_braille["b"]], @translator.translate(["b"])
  end

  def test_it_can_multiple_letters_to_braille_character
    assert_equal [@alphabet.alpha_to_braille["a"], @alphabet.alpha_to_braille["b"]], @translator.translate(["a", "b"])
  end

  def test_it_can_transpose_braille_array_for_printing
    input_string = @translator.read_from_file
    input_string_array = @translator.convert_string_to_char_array(input_string)
    translated_array = @translator.translate(input_string_array)
    braille_string = @translator.format_braille_to_print(translated_array)
    assert_equal "0.0.\n..0.\n....\n", braille_string.chomp
  end
end
