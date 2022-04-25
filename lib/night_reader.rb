require './lib/dictionary'
require './lib/english_translator'


if ARGV.length != 2
    p "incorrect number of arguments"
    exit
end

braille_file = File.open(ARGV[0], "r")
og_message_file = File.open(ARGV[1], "w")
english_translator = EnglishTranslator.new 

new_text_array = braille_file.read 

p english_translator.message

braille_input = new_text_array.join
