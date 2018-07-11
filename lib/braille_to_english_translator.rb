require './lib/braille_to_english_alphabet'

class Translator

  def initialize(input_file, output_file)
    @input_file = input_file
    @output_file = output_file
  end

  def print_message(input_string)
    "Created '#{@output_file}' containing #{input_string.length} characters."
  end

  def read_from_file
    file_input = File.open(@input_file, "r")
    input_string = file_input.read
    file_input.close
    print_message(input_string)
    input_string.chomp
  end

  def translate(braille_array)
    alphabet = BrailleToEnglishAlphabet.new
    translated = alphabet.braille_to_english[braille_array]
  end
end
