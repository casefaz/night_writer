require './lib/dictionary'

if ARGV.length != 2 
    p "Error"
    exit
end

message_file_path = ARGV[0]
braille_file_path = ARGV[1]

message_file = File.open(ARGV[0], "r") #makes it a file object, r makes it readable
braille_file = File.open(ARGV[1], "w")

text_array = message_file.readlines
character_count = text_array.join.length

p "Created '#{braille_file_path}' containing #{character_count} characters"

message_input = text_array.join
dictionary = Dictionary.new(message_input)
dictionary.format_braille
# require 'pry'; binding.pry