if ARGV.length != 2
    p "incorrect number of arguments"
    exit
end

braille_file = File.open(ARGV[0], "r")
og_message_file = File.open(ARGV[1], "w")

new_text_array = braille_file.read 
new_character_count = new_text_array.length

p "Created '#{original_message_file_path}' containing #{new_character_count} characters"

braille_input = new_text_array.join
dictionaryish = Dictionary.new(braille_input)
dictionary.read_braille