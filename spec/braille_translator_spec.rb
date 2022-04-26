require './lib/dictionary'
require './lib/braille_translator'

RSpec.describe BrailleTranslator do
    it 'exists' do 
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator).to be_a(BrailleTranslator)
    end

    it 'has attributes' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.user_input1).to eq('message.txt')
        expect(braille_translator.user_input2).to eq('braille.txt')
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

    it '#receive_character can tell what an english character is in braille' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.receive_character("a")).to eq (["0.", "..", ".."])
        expect(braille_translator.receive_character("!")).to eq("Not familiar, unfortunately")
    end

    it 'can count the number of characters in the incoming file' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.count_characters).to eq(File.size('message.txt'))
    end

    it 'can test for multiple characters' do 
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        expect(braille_translator.format_braille).to eq(nil)
    end
    
    it 'can split lines over 80 dots' do
        braille_translator = BrailleTranslator.new('message.txt', 'braille.txt')
        braille_translator.format_braille

        expect(braille_translator.split_lines("the ring can be destroyed and it was destroyed")).to be_a(Array)
        expect(File.size("test_braille.txt")).to eq(282)
    end

end