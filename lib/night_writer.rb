require "./lib/english_to_braille_translator"
require "./lib/english_to_braille_alphabet"

translator = Translator.new(ARGV[0], ARGV[1])

input_string = translator.read_from_file
input_string_array = translator.convert_string_to_char_array(input_string)
translated_array = translator.translate(input_string_array)
translator.limit_lines_to_80_chars(translated_array)
