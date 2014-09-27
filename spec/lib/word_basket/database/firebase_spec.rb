require 'spec_helper'

module WordBasket
  describe Word do
    let(:word) { Word.new('あいうえお') }
    subject { word }

    context '#new with "あいうえお"' do
      describe '#to_json' do
        it { expect(word.to_json).to eq '{ "あ": { "お": { "name": "あいうえお" }}}' }
      end
    end
  end
end
