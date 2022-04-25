require './lib/dictionary'
require './lib/braille_translator'

RSpec.describe BrailleTranslator do
    it 'exists' do 
        braille_translator = BrailleTranslator.new
        expected = File.open("message.txt").readlines
        expect(braille_translator).to be_a(BrailleTranslator)
        expect(braille_translator.english_message.readlines).to eq(expected)
    end

    it 'has a braille hash' do 
        braille_translator = BrailleTranslator.new
        expect(braille_translator.braille_hash["a"]).to eq(["0.", "..", ".."])
        expect(braille_translator.braille_hash.count).to eq 27
    end

    it '#receive_character' do
        braille_translator = BrailleTranslator.new
        expect(braille_translator.receive_character("a")).to eq (["0.", "..", ".."])
        expect(braille_translator.receive_character("!")).to eq("Not familiar, unfortunately")
    end

    it 'can test for multiple characters' do 
        braille_translator = BrailleTranslator.new
        # @braille_translator.format_braille
        # new_file = File.open("test_braille.txt")
        # expected_characters = new_file.read
        # new_file.close
        braille_translator.format_braille
        expect(File.size("test_braille.txt")).to eq(282)
    end
    
    it 'can split lines over 80 dots' do 
        braille_translator = BrailleTranslator.new
        braille_translator.format_braille

        expect(braille_translator.split_lines("the ring can be destroyed and it was destroyed")).to be_a(Array)
        # require'pry';binding.pry
        expect(File.size("test_braille.txt")).to eq(282)
    end

end