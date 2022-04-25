require './lib/dictionary'
require './lib/braille_translator'

if ARGV.length != 2 
    p "Error"
    exit
end

message_file = File.open(ARGV[0], "r")
braille_file = File.open(ARGV[1], "w")
braille_translator = BrailleTranslator.new(ARGV[1], ARGV2)
# require 'pry';binding.pry

text_array = message_file.readlines

p braille_translator.message
braille_translator.format_braille

message_input = text_array.join

# require 'pry'; binding.pry