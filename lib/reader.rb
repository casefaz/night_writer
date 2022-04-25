class Reader


    attr_reader :input_file_path, :output_file_path
    def initialize(input, output)
        @input_file_path = #take incoming argv[0] to read it
        @output_file_path = #open desired argv[1] path being written to
    end 

    def character_count #count the number of characters in argv[1] path
        @input_file_path.length 
    end

    def message#print out number of characters and file path name
    end
end