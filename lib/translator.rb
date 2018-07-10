require "./lib/braille_alphabet"
require "pry"

class Translator

    def initialize(input_file, output_file)
      @input_file = input_file
      @output_file = output_file
    end

    def print_message(input_string)
      "Created '#{@output_file}' containing #{input_string.length} characters"
    end

    def read_from_file
      file_input = File.open(@input_file, "r")
      input_string = file_input.read
      file_input.close
      puts print_message(input_string.chomp)
      input_string
    end

    def write_to_file(braille_array)
      destination_file = File.open(@output_file, "w")
      destination_file.write(braille_array)
      destination_file.close
    end

    def convert_string_to_char_array(string)
      string_array = string.chomp.chars
    end

    def translate(char_array)
      alphabet = BrailleAlphabet.new
      braille_array = []
      char_array.map do |character|
        braille_array << alphabet.alpha_to_braille[character]
      end
      braille_array
    end

    def format_braille_to_print(braille_array)
      top_line = braille_array.transpose[0].join
      middle_line = braille_array.transpose[1].join
      bottom_line = braille_array.transpose[2].join
      printable_string = top_line + "\n" + middle_line + "\n" + bottom_line
    end

    def limit_lines_to_40_chars(char_array)
      if char_array.length <= 40
        braille_array = translate(char_array)
        formatted_braille_array = format_braille_to_print(braille_array)
        write_to_file(formatted_braille_array)
      else
        limit_lines_to_40_chars(char_array.slice(1..40))
        sliced_char_array = char_array.slice(41..char_array.length)
        limit_lines_to_40_chars(sliced_char_array)
      end
    end
end
