class Reader


    attr_reader :input_file_path, :outgoing_file_path
    def initialize(input_file_path, outgoing_file_path)
        @input_file_path = ARGV[0]
        @outgoing_file_path = ARGV[1]
        @braille_conversion = BrailleConversion.new 
    end 
end