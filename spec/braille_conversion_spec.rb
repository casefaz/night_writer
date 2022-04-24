require './lib/dictionary'
require './lib/braille_conversion'

RSpec.describe BrailleConversion do
    before :each do 
        @braille_conversion = BrailleConversion.new
    end

    it 'exists' do 
        expect(@braille_conversion).to be_a(BrailleConversion)
    end
end