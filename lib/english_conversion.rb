class EnglishConversion 

attr_reader :braille_message, :english_characters
    def initialize(braille_message)
        @message = File.open("original_message.txt", "w")
        @braille_message = File.open("test_braille.txt", "r")
        @english_characters = Dictionary.new.english_characters
        # require 'pry';binding.pry
    end

    def long_braille_array
        @braille_message
        expected_characters = @braille_message.readlines
        braille_array = []
        expected_characters.map! { |element| element.delete("\n")}
        until expected_characters.join.length == 0
            braille_array << "#{expected_characters[0].slice!(0..1)}#{expected_characters[1].slice!(0..1)}#{expected_characters[2].slice!(0..1)}"
        end
        require 'pry';binding.pry
        return braille_array
    end
    
    def translate_to_english
        braille_pieces = long_braille_array
        input_collector = []
        braille_pieces.each do |element|
            if @english_characters.keys.include?(element)
                input_collector << @english_characters[element]
            end
        end
        @message.write(input_collector.join)
        @message.close
        input_collector.join
    end

end