


class EnglishConversion 

attr_reader :braille_message
    def initialize(braille_message)
        @brail_message = braille_message
        @english_characters = Dictionary.new.english_characters
        require 'pry';binding.pry
    end

    def reformat_braille
        braille_array = []
    end

    def braille_to_english(braille)
        if @english_characters.keys.include?(braille)
            @english_characters[braille]
        end
        # require 'pry'; binding.pry
    end

    def read_braille
        #iterate through expected_characters(in test braille file) at each index .slice!(0..1) and shovel it in - where?

    end


end