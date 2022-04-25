require './lib/dictionary'
require './lib/braille_conversion'

RSpec.describe BrailleConversion do
    it 'exists' do 
        braille_conversion = BrailleConversion.new
        expected = File.open("message.txt").readlines
        expect(braille_conversion).to be_a(BrailleConversion)
        expect(braille_conversion.english_message.readlines).to eq(expected)
    end

    it 'has a braille hash' do 
        braille_conversion = BrailleConversion.new
        expect(braille_conversion.braille_hash["a"]).to eq(["0.", "..", ".."])
        expect(braille_conversion.braille_hash.count).to eq 27
    end

    it '#receive_character' do
        braille_conversion = BrailleConversion.new
        expect(braille_conversion.receive_character("a")).to eq (["0.", "..", ".."])
        expect(braille_conversion.receive_character("!")).to eq("Not familiar, unfortunately")
    end

    it 'can test for multiple characters' do 
        braille_conversion = BrailleConversion.new
        # @braille_conversion.format_braille
        # new_file = File.open("test_braille.txt")
        # expected_characters = new_file.read
        # new_file.close
        braille_conversion.format_braille
        expect(File.size("test_braille.txt")).to eq(16)
    end
    
    it 'can split lines over 80 dots' do 
        braille_conversion = BrailleConversion.new
        braille_conversion.format_braille

        expect(braille_conversion.split_lines("the ring can be destroyed and it was destroyed")).to be_a(Array)
        # require'pry';binding.pry
        expect(File.size("test_braille.txt")).to eq(282)
    end

end