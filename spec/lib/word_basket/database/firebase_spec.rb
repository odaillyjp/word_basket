require 'spec_helper'
require 'word_basket/database/firebase'

module WordBasket
  describe Word do
    let(:word) { Word.new('あいうえお') }
    subject { word }

    context '#new with "あいうえお"' do
      describe '#to_json' do
        it { expect(word.to_json).to eq '{ "name": "あいうえお", "furigana": "あいうえお" }' }
      end
    end
  end
end
