require './lib/dictionary'
require './lib/braille_translator'

if ARGV.length != 2 
    p "Error"
    exit
end
# require 'pry'; binding.pry
message_file = File.open(ARGV[0], "r")
braille_file = File.open(ARGV[1], "w")
braille_translator = BrailleTranslator.new(ARGV[0], ARGV[1])


p braille_translator.message
braille_translator.format_braille
