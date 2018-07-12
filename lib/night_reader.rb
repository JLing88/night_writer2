require "./lib/braille_to_english_alphabet"
require "./lib/braille_to_english_translator"

translator = Translator.new(ARGV[0], ARGV[1])

braille_string = translator.read_from_file
english_string = translator.translate(braille_string)
translator.write_to_file(english_string)
puts translator.print_message(english_string)
