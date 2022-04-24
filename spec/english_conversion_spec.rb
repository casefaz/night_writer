require './lib/dictionary'
require './lib/english_conversion'


RSpec.describe EnglishConversion do 
    before :each do
        @english_conversion = EnglishConversion.new
    end
    it 'exists' do 
        expect(@english_conversion).to be_a(EnglishConversion)
    end
end