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

        it '#receive_character' do
            expect(@dictionary.receive_character("a")).to eq (["0.", "..", ".."])
            expect(@dictionary.receive_character("!")).to eq("Not familiar, unfortunately")
        end

        it 'can format the braille' do
            @dictionary2 = Dictionary.new("hello world")

            expect(@dictionary2.format_braille.length).to eq(68) 
        end

        it 'splits characters over 80 lines' do
            @dictionary3 = Dictionary.new("the ring cannot be destroyed by anything here that we possess") 
            expect(@dictionary3.split_line).to eq(string)
        end

end