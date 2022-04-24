
require './lib/dictionary'

RSpec.describe Dictionary do 

    it 'exists and has attributes' do 
        dictionary = Dictionary.new
        expect(dictionary).to be_a(Dictionary)
        expect(dictionary.braille_characters["a"]).to eq(["0.", "..", ".."])
        expect(dictionary.english_characters[["0.", ".0", "00"]]).to eq("z")
    end
end