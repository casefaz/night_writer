class EnglishTranslator 

attr_reader :braille_message, :english_characters
    def initialize(braille_message)
        @message = File.open("original_message.txt", "w")
        @braille_message = File.open("test_braille.txt", "r")
        @read_braille = @braille_message.readlines
        # require'pry';binding.pry
        @english_characters = Dictionary.new.english_characters
    end

    def count_characters
        @read_braille.join.length
    end

    def message
        p "Created '#{ARGV[1]}' containing #{count_characters / 6} characters"
    end

    def long_braille_array
        expected_characters = @read_braille
        braille_array = []
        expected_characters.map! { |element| element.delete("\n")}
        # require 'pry'; binding.pry
        until expected_characters.join.length == 0
            # require 'pry';binding.pry
            braille_array << "#{expected_characters[0].slice!(0..1)}#{expected_characters[1].slice!(0..1)}#{expected_characters[2].slice!(0..1)}"
        end
        # require 'pry';binding.pry
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