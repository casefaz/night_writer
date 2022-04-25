require './lib/dictionary'
require './lib/english_translator'


RSpec.describe EnglishTranslator do 
    before :each do
        @english_translator = EnglishTranslator.new(["0.0.0.0.0.\n", "00.00.0..0\n", "....0.0.0.\n"])
    end

    xit 'exists' do 
        expect(@english_translator).to be_a(EnglishTranslator)
    end

    xit 'has an english hash' do
        expect(@english_translator.english_characters["0..000"]).to eq("z")
    end

    xit 'can read braille characters' do 
        expect(@english_translator.long_braille_array).to eq(["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00."])
    end

    xit 'can translate the braille array' do 
        expect(@english_translator.translate_to_english).to eq("hello")
    end

end