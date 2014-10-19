require 'spec_helper'

module WordBasket
  describe Word do
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

    # public instance methods

    context '#new with "ウォーミングアップ"' do
      let(:word) { Word.new('ウォーミングアップ') }
      subject { word }

      describe '#name' do
        it { expect(word.name).to eq 'ウォーミングアップ' }
      end

      describe '#furigana' do
        it { expect(word.furigana).to eq 'うぉーみんぐあっぷ' }
      end

      describe '#head' do
        it { expect(word.head).to eq 'う' }
      end

      describe '#last' do
        it { expect(word.last).to eq 'ふ' }
      end

      # private instance methods

      describe '#include_hira_or_kata_only?'do
        context 'with "ひらがなカタカナ"' do
          it { expect(word.send(:include_hira_or_kata_only?, 'ひらがなカタカナ')).to be_truthy }
        end

        context 'with "かんじ漢字かんじ"' do
          it { expect(word.send(:include_hira_or_kata_only?, 'かんじ漢字かんじ')).to be_falsy }
        end
      end

      describe '#convert_to_hira' do
        context 'with "パーフェクト"' do
          it { expect(word.send(:convert_to_hira, 'パーフェクト')).to eq 'ぱーふぇくと' }
        end
      end

      describe '#remove_dakuten_form_char' do
        context 'with "ざ"' do
          it { expect(word.send(:remove_dakuten_from_char, 'ざ')).to eq 'さ' }
        end

        context 'with "ぱ"' do
          it { expect(word.send(:remove_dakuten_from_char, 'ぱ')).to eq 'は' }
        end
      end
    end
  end
end
