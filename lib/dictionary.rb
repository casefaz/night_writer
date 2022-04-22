class Dictionary

attr_reader :braille_characters, :message_input
    def initialize(message_input)
        @braille_characters = {
        "a" => ["0.", "..", ".."],
        "b" => ["0.", "0.", ".."],
        "c" => ["00", "..", ".."],
        "d" => ["00", ".0", ".."],
        "e" => ["0.", ".0", ".."],
        "f" => ["00", "0.", ".."],
        "g" => ["00", "00", ".."],
        "h" => ["0.", "00", ".."],
        "i" => [".0", "0.", ".."],
        "j" => [".0", "00", ".."],
        "k" => ["0.", "..", "0."],
        "l" => ["0.", "0.", "0."],
        "m" => ["00", "..", "0."],
        "n" => ["00", ".0", "0."],
        "o" => ["0.", ".0", "0."],
        "p" => ["00", "0.", "0."],
        "q" => ["00", "00", "0."],
        "r" => ["0.", "00", "0."],
        "s" => [".0", "0.", "0."],
        "t" => [".0", "00", "0."],
        "u" => [".0", "..", "00"],
        "v" => ["0.", "0.", "00"],
        "w" => [".0", "00", ".0"],
        "x" => ["00", "..", "00"],
        "y" => ["00", ".0", "00"],
        "z" => ["0.", ".0", "00"],
        " " => ["..", "..", ".."]
        }
        @message_input = message_input
    end

    def receive_character(character) #take input from message and return matching braille character
        #write to txt file now or return a string and write to txt later
        @braille_characters[character]
    end

    def format_braille #consider edge cases, no more than 80 characters(40 braille characters)
        braille = File.open("braille.txt", "w")
        top = ""
        middle = ""
        bottom = ""
        @message_input.split("").each do |letter|
            top << receive_character(letter)[0]
            middle << receive_character(letter)[1]
            bottom << receive_character(letter)[2]
        end
        # require 'pry'; binding.pry
        braille.write("#{top}\n#{middle}\n#{bottom}")
        return "#{top}\n#{middle}\n#{bottom}"
        # require 'pry'; binding.pry
    end
end