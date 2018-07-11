require "./lib/braille_to_english_alphabet"
require "./lib/braille_to_english_translator"

translator = Translator.new(ARGV[0], ARGV[1])
