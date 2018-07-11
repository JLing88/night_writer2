require './lib/braille_to_english_alphabet'
require 'pry'

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

  def translate(braille_string)
    alphabet = BrailleToEnglishAlphabet.new
    split = braille_string.split("\n")
    top_holder = split[0].scan(/../)
    mid_holder = split[1].scan(/../)
    low_holder = split[2].scan(/../)

    holder = []
    x = 0
    while holder.count < top_holder.length
      holder << x
      x += 1
    end

    translated_chars = []

    holder.each do |index|
      braille_char = [top_holder[index]] + [mid_holder[index]] + [low_holder[index]]
      translated = alphabet.braille_to_english[braille_char]
      translated_chars << translated
    end
    translated_chars.join
  end

  def write_to_file(english_string)
    file_output = File.open(@output_file, "a")
    file_output.write(english_string)
  end
end
