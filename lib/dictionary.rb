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

    def receive_character(english_character)
       if @braille_characters.keys.include?(english_character) == false
        p "Not familiar, unfortunately"
       else
        @braille_characters[english_character]
       end
    end

    def format_braille 
        braille = File.open("braille.txt", "w")
        # top = ""
        # middle = ""
        # bottom = ""
        split_messages = split_lines(@message_input)
        # require'pry';binding.pry
        split_messages.each do |split_message|
            top = ""
            middle = ""
            bottom = ""
            split_message.split("").each do |letter|
        # require'pry';binding.pry
                top << receive_character(letter)[0]
                middle << receive_character(letter)[1]
                bottom << receive_character(letter)[2]
                # braille.write("#{top}\n#{middle}\n#{bottom}\n")
            end
            braille.write("#{top}\n#{middle}\n#{bottom}\n")
        end
        # braille.write("#{top}\n#{middle}\n#{bottom}")
            #figure out how to split either every 40 english characters(@message_input) or every 80 braille characters(braille.write) onto new lines
        braille.close
    end

    def split_lines(message)
        under_40 = []
        if message.length <= 39
            under_40 << message
        else
            while message.length > 0
                under_40 << message.slice!(0..39)
            end
        end
        # require'pry';binding.pry
        under_40
    end
end