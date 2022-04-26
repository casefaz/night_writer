require './lib/dictionary'
require './lib/english_translator'


if ARGV.length != 2
    p "incorrect number of arguments"
    exit
end
english_translator = EnglishTranslator.new(ARGV[0], ARGV[1]) 

p english_translator.message
english_translator.translate_to_english
