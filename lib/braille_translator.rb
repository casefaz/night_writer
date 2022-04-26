class BrailleTranslator

attr_reader :braille_hash, :english_message, :read_english, :user_input1, :user_input2
    def initialize(user_input1, user_input2)
        @english_message = File.open(user_input1, "r")
        @read_english = @english_message.read.chomp
        @braille = File.open(user_input2, "w")
        @braille_hash = Dictionary.new.braille_characters
        @user_input1 = user_input1
        @user_input2 = user_input2
    end

    def count_characters
        @read_english.length
    end

    def message
        "Created '#{@user_input2}' containing #{count_characters} characters"
    end

    def receive_character(english_character)
        if @braille_hash.keys.include?(english_character) == false
         p "Not familiar, unfortunately"
        else
         @braille_hash[english_character]
        end
     end

     def format_braille
        @braille
        split_messages = split_lines(@read_english)
        split_messages.each do |split_message|
            top = ""
            middle = ""
            bottom = ""
            split_message.split("").each do |letter|
                top << receive_character(letter)[0]
                middle << receive_character(letter)[1]
                bottom << receive_character(letter)[2]
            end
            @braille.write("#{top}\n#{middle}\n#{bottom}\n")
        end
        return  
        @braille.close
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