class BrailleConversion

attr_reader :dictionary, :braille_hash
    def initialize(message)
        @message = message
        @braille_hash = @dictionary = Dictionary.new(message).braille_characters
        # require'pry';binding.pry
    end

    def receive_character(english_character)
        if @braille_hash.keys.include?(english_character) == false
         p "Not familiar, unfortunately"
        else
         @braille_hash[english_character]
        end
     end

     def format_braille 
        braille = File.open("braille.txt", "w")
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
            end
            braille.write("#{top}\n#{middle}\n#{bottom}\n")
        end
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
        under_40
    end
end