require 'spec_helper'
require 'word_basket/word'

module WordBasket
  describe Word do
    let(:word) { Word.new('あいうえお') }
    subject { word }

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:head) }
    it { is_expected.to respond_to(:last) }

    context '"わーどばすけっと", "わーばす", "ばすけっと" saved' do
      before do
        Word.create('わーどばすけっと')
        Word.create('わーばす')
        Word.create('ばすけっと')
      end

      describe '.sample' do
        context 'with head "わ", last "と"' do
          it { expect(Word.sample(head: 'わ', last: 'と').name).to eq 'わーどばすけっと' }
        end

        context 'with head "わ", last "お"' do
          it { expect(Word.sample(head: 'わ', last: 'お')).to be_nil }
        end

        context 'with head "お", last "と"' do
          it { expect(Word.sample(head: 'お', last: 'と')).to be_nil }
        end
      end

      describe '.remove_dakuten' do
        context 'with "が"' do
          it { expect(Word.send(:remove_dakuten, 'が')).to eq 'か' }
        end
      end
    end

    describe '#name' do
      it { expect(word.name).to eq 'あいうえお' }
    end
  end
end
