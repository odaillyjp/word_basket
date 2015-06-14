require 'spec_helper'
require 'word_basket/database/local_file'

module WordBasket
  describe Word do
    let(:word) { Word.new('あいうえお') }
    subject { word }

    context '#new with "あいうえお"' do
      describe '#to_h' do
        it 'should return tha word hash' do
          hash = word.to_h
          expect(hash['name']).to eq 'あいうえお'
          expect(hash['furigana']).to eq 'あいうえお'
          expect(hash['head']).to eq 'あ'
          expect(hash['last']).to eq 'お'
        end
      end
    end
  end

  describe Database::LocalFile do
    let(:options) { WordBasket.configuration.database_options }
    it_should_behave_like 'a database strategy', WordBasket::Database::LocalFile
  end
end
