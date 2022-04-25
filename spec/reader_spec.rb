require './lib/reader'
require './lib/braille_conversion'
require './lib/dictionary'

RSpec.describe Reader do

    it 'exists' do 
        reader = Reader.new('message.txt', 'braille.txt')
        expect(reader).to be_a(Reader)
    end

    #open the files, read them, and 
    it 'has attributes' do
        reader = Reader.new('message.txt', 'braille.txt')
        expect(reader.input_file_path).to eq('message.txt')
        expect(reader.outgoing_file_path).to eq('braille.txt')
    end

end