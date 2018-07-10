require "./lib/translator"
require "./lib/braille_alphabet"

translator = Translator.new(ARGV[0], ARGV[1])

input_string = translator.read_from_file
input_string_array = translator.convert_string_to_char_array(input_string)
translator.limit_lines_to_40_chars(input_string_array)
