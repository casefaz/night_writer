#dictionary method to load a-z keys = english, values = braille equivalent
#don't need to call every letter each time the dictionary is used - have a look up table and caller method
#@dictionary = create dictionary --> create dictionary == method

require './lib/dictionary'

RSpec.describe Dictionary do 

    before :each do 
        @dictionary = Dictionary.new
    end
    
        it 'exists' do 
            expect(@dictionary).to be_a(Dictionary)
        end
end