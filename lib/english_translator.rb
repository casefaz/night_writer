class EnglishTranslator 

attr_reader :english_characters, :user_input1, :user_input2
    def initialize(user_input1, user_input2)
        @original_message = File.open(user_input2, "w")
        @braille_message = File.open(user_input1, "r")
        @english_characters = Dictionary.new.english_characters
        @user_input1 = user_input1
        @user_input2 = user_input2
        @expected_characters = @braille_message.readlines
    end

    def count_characters
        @expected_characters.map! { |element| element.delete("\n")}
        count = @expected_characters.join.length / 6
    end

    def message
        "Created '#{user_input2}' containing #{count_characters} characters"
    end

    def long_braille_array
        braille_array = []
        counter = 0
        while counter < count_characters * 6
            counter += 1
            braille_array << "#{@expected_characters[0].slice!(0..1)}#{@expected_characters[1].slice!(0..1)}#{@expected_characters[2].slice!(0..1)}"

        end
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
        @original_message.write(input_collector.join)
        @original_message.close
        input_collector.join
    end

end