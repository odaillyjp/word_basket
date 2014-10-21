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

  describe Firebase do
    let(:firebase) { WordBasket::Database::Firebase.new }
    subject { firebase }

    it { is_expected.to be_respond_to(:set) }
    it { is_expected.to be_respond_to(:sample) }
  end
end
