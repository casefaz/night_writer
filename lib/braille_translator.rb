class BrailleTranslator

attr_reader :braille_hash, :english_message
    def initialize#change this to take in message.txt file path
        @english_message = File.open("message.txt", "r")
        @braille = File.open("test_braille.txt", "w")
        @braille_hash = Dictionary.new.braille_characters
        # require'pry';binding.pry
    end

    def receive_character(english_character)
        if @braille_hash.keys.include?(english_character) == false
         p "Not familiar, unfortunately"
        else
         @braille_hash[english_character]
        end
     end

     def format_braille #writes to the braille file
        @braille
        split_messages = split_lines(@english_message.read)
        # require'pry';binding.pry
        split_messages.each do |split_message|
            top = ""
            middle = ""
            bottom = ""
            # require'pry';binding.pry
            split_message.split("").each do |letter|
        # require'pry';binding.pry
                top << receive_character(letter)[0]
                middle << receive_character(letter)[1]
                bottom << receive_character(letter)[2]
            end
            @braille.write("#{top}\n#{middle}\n#{bottom}\n")
        end
        @braille.close
    end

    def split_lines(message)
        under_40 = []
        # require 'pry';binding.pry
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