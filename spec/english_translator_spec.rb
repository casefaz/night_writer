require './lib/dictionary'
require './lib/english_translator'


RSpec.describe EnglishTranslator do 
    before :each do
        @english_translator = EnglishTranslator.new('braille.txt','original_message.txt')
    end

    it 'exists' do 
        expect(@english_translator).to be_a(EnglishTranslator)
    end

    it 'has a welcome message' do
        expect(@english_translator.message).to eq("Created 'original_message.txt' containing 5 characters")
    end

    it 'can count the number of characters in incoming file' do
        expect(@english_translator.count_characters).to eq(5)
    end

    it 'has an english hash' do
        expect(@english_translator.english_characters["0..000"]).to eq("z")
    end

    it 'can read braille characters' do 
        
        expect(@english_translator.long_braille_array).to eq(["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00."])
    end

    it 'can translate the braille array' do 
        expect(@english_translator.translate_to_english).to eq("hello")
    end

end