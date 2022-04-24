require './lib/dictionary'
require './lib/english_conversion'


RSpec.describe EnglishConversion do 
    before :each do
        @english_conversion = EnglishConversion.new(["0.0.0.0.0.\n", "00.00.0..0\n", "....0.0.0.\n"])
    end

    it 'exists' do 
        expect(@english_conversion).to be_a(EnglishConversion)
    end

    xit 'has an english hash' do
        expect(@dictionary.english_characters[["0.", ".0", "00"]]).to eq("z")
    end

    xit '#braille_to_english' do
        expect(@dictionary.braille_to_english(["0.", ".0", "00"])).to eq("z")
    end

    xit 'can format the braille into english' do 
        @english_conversion2.read_braille
        newish_file = File.open("test_braille.txt", "r")
        expected_characters = newish_file.read
        newish_file.close
        expect(expected_characters).to eq("hi")
    end

    xit 'fake test' do 
        newish_file = File.open("test_braille.txt", "r")
        expected_characters = newish_file.readlines
        newish_file.close
        require'pry';binding.pry
    end
end