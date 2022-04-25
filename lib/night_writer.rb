require './lib/dictionary'
require './lib/braille_translator'

if ARGV.length != 2 
    p "Error"
    exit
end

message_file = File.open(ARGV[0], "r")
braille_file = File.open(ARGV[1], "w")
braille_translator = BrailleTranslator.new

text_array = message_file.readlines
character_count = text_array.join.length

p "Created '#{braille_file_path}' containing #{character_count} characters"

message_input = text_array.join

# require 'pry'; binding.pry