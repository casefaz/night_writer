class BrailleConversion


    def initialize
        @dictionary = Dictionary.new
    end

    def receive_character(english_character)
        if @braille_characters.keys.include?(english_character) == false
         p "Not familiar, unfortunately"
        else
         @braille_characters[english_character]
        end
     end
end