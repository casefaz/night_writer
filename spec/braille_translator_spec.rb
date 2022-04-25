require './lib/dictionary'
require './lib/braille_translator'

RSpec.describe BrailleTranslator do
    it 'exists' do 
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expected = File.open("message.txt").read
        expect(braille_translator).to be_a(BrailleTranslator)
        expect(braille_translator.read_english).to eq(expected)
    end
    
    it 'has a welcome message' do 
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.message).to eq("Created 'braille.txt' containing 5 characters")
    end

    it 'has a braille hash' do 
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.braille_hash["a"]).to eq(["0.", "..", ".."])
        expect(braille_translator.braille_hash.count).to eq 27
    end

    it '#receive_character' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.receive_character("a")).to eq (["0.", "..", ".."])
        expect(braille_translator.receive_character("!")).to eq("Not familiar, unfortunately")
    end

    it 'can count the number of characters in the incoming file' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.count_characters).to eq(File.size("message.txt"))
    end

    it 'can test for multiple characters' do 
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        # @braille_translator.format_braille
        # new_file = File.open("test_braille.txt")
        # expected_characters = new_file.read
        # new_file.close
        braille_translator.format_braille
        expect(File.size("test_braille.txt")).to eq(282)
    end
    
    it 'can split lines over 80 dots' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        braille_translator.format_braille

        expect(braille_translator.split_lines("the ring can be destroyed and it was destroyed")).to be_a(Array)
        # require'pry';binding.pry
        expect(File.size("test_braille.txt")).to eq(282)
    end

end