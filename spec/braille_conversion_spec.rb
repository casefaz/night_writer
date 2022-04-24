require './lib/dictionary'
require './lib/braille_conversion'

RSpec.describe BrailleConversion do
    before :each do 
        @braille_conversion = BrailleConversion.new("hello")
    end

    it 'exists' do 
        expect(@braille_conversion).to be_a(BrailleConversion)
    end

    it 'has a braille hash' do 
        expect(@braille_conversion.braille_characters["a"]).to eq(["0.", "..", ".."])
        expect(@braille_conversion.braille_characters.count).to eq 27
    end

    xit '#receive_character' do
        expect(@braille_conversion.receive_character("a")).to eq (["0.", "..", ".."])
        expect(@braille_conversion.receive_character("!")).to eq("Not familiar, unfortunately")
    end

    xit 'can test for multiple characters' do 
        expected = ("0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n")
        @dictionary2.format_braille
        new_file = File.open("braille.txt")
        expected_characters = new_file.read
        new_file.close
        expect(expected_characters).to eq(expected)
    end
    
    xit 'can split lines over 80 dots' do 
        dictionary3 = Dictionary.new("the ring cannot be destroyed by anything here that we possess") 
        dictionary3.format_braille

        expect(dictionary3.split_lines("the ring cannot be destroyed by anything here that we possess")).to be_a(Array)
        expect(File.size("braille.txt")).to eq(372)
    end

end