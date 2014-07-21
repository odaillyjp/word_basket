require 'spec_helper'
require 'word_basket/word'

module WordBasket
  describe Word do
    let(:word) { Word.new('あいうえお') }
    subject { word }

    # public class methods

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
    end

    # private class methods

    describe '.convert_head_index' do
      context 'with "パーフェクト"' do
        it { expect(Word.send(:convert_head_index, 'パーフェクト')).to eq 'は' }
      end
    end

    describe '.convert_last_index' do
      context 'with "ウォーミングアップ"' do
        it { expect(Word.send(:convert_last_index, 'ウォーミングアップ')).to eq 'ふ' }
      end
    end

    describe '.convert_char_index' do
      context 'with "ガ"' do
        it { expect(Word.send(:convert_char_index, 'ガ')).to eq 'か' }
      end
    end

    describe '.remove_dakuten' do
      context 'with "ざ"' do
        it { expect(Word.send(:remove_dakuten, 'ざ')).to eq 'さ' }
      end
    end

    # public instance methods

    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:head) }
    it { is_expected.to respond_to(:last) }

    describe '#name' do
      it { expect(word.name).to eq 'あいうえお' }
    end
  end
end
