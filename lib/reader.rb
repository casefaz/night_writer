class Reader


    attr_reader :input_file_path, :output_file_path
    def initialize(input, output)
        @input_file_path = input
        @output_file_path = output
        @braille_conversion = BrailleTranslator.new 
    end 
end