require './lib/dictionary'
require './lib/braille_conversion'

RSpec.describe BrailleConversion do
    before :each do 
        @braille_conversion = BrailleConversion.new("hello")
        @braille_conversion2 = BrailleConversion.new("the ring cannot be destroyed by anything here that we possess")
    end

    it 'exists' do 
        expect(@braille_conversion).to be_a(BrailleConversion)
        expect(@braille_conversion.english_message).to eq("hello")
    end

    it 'has a braille hash' do 
        expect(@braille_conversion.braille_hash["a"]).to eq(["0.", "..", ".."])
        expect(@braille_conversion.braille_hash.count).to eq 27
    end

    it '#receive_character' do
        expect(@braille_conversion.receive_character("a")).to eq (["0.", "..", ".."])
        expect(@braille_conversion.receive_character("!")).to eq("Not familiar, unfortunately")
    end

    it 'can test for multiple characters' do 
        expected = ("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")
        @braille_conversion.format_braille("test_braille.txt")
        new_file = File.open("test_braille.txt")
        expected_characters = new_file.read
        new_file.close
        expect(expected_characters).to eq(expected)
    end
    
    it 'can split lines over 80 dots' do 
        @braille_conversion2.format_braille("braille.txt")

        expect(@braille_conversion2.split_lines("the ring cannot be destroyed by anything here that we possess")).to be_a(Array)
        expect(File.size("braille.txt")).to eq(372)
    end

end