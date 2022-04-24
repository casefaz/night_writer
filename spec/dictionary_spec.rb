#dictionary method to load a-z keys = english, values = braille equivalent
#don't need to call every letter each time the dictionary is used - have a look up table and caller method
#@dictionary = create dictionary --> create dictionary == method

require './lib/dictionary'

RSpec.describe Dictionary do 

    before :each do 
        @dictionary = Dictionary.new("a")
    end

        it 'exists' do 
            expect(@dictionary).to be_a(Dictionary)
            expect(@dictionary.message_input).to eq("a")
        end

        it 'has a braille hash' do 
            expect(@dictionary.braille_characters["a"]).to eq(["0.", "..", ".."])
            expect(@dictionary.braille_characters.count).to eq 27
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
            expect(File.size("braille.txt")).to eq(368)
        end

end