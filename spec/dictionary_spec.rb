#dictionary method to load a-z keys = english, values = braille equivalent
#don't need to call every letter each time the dictionary is used - have a look up table and caller method
#@dictionary = create dictionary --> create dictionary == method

require './lib/dictionary'

RSpec.describe Dictionary do 

    before :each do 
        @dictionary = Dictionary.new("a")
        @dictionary2 = Dictionary.new("hello")
    end

        it 'exists' do 
            expect(@dictionary).to be_a(Dictionary)
            expect(@dictionary.message_input).to eq("a")
        end

        it 'has a braille hash' do 
            expect(@dictionary.braille_characters["a"]).to eq(["0.", "..", ".."])
            expect(@dictionary.braille_characters.count).to eq 27
        end

        it 'can test for multiple characters' do 
            expected = ("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")
            @dictionary2.format_braille
            new_file = File.open("braille.txt")
            expected_characters = new_file.read
            new_file.close
            expect(expected_characters).to eq(expected)
        end
#potential test for multiple characters to braille
        it '#receive_character' do
            expect(@dictionary.receive_character("a")).to eq (["0.", "..", ".."])
            expect(@dictionary.receive_character("!")).to eq("Not familiar, unfortunately")
        end

        it 'can split lines over 80 dots' do 
            dictionary3 = Dictionary.new("the ring cannot be destroyed by anything here that we possess") 
            dictionary3.format_braille

            expect(dictionary3.split_lines("the ring cannot be destroyed by anything here that we possess")).to be_a(Array)
            expect(File.size("braille.txt")).to eq(372)
        end

end