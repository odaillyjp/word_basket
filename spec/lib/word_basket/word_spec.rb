require 'spec_helper'

module WordBasket
  describe Word do
    context '"わーどばすけっと", "わーばす", "ばすけっと" saved' do
      # TODO: レコードを削除する後処理を入れる

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

    context '.new with "ウォーミングアップ"' do
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

      describe '#remove_dakuten_form_char' do
        context 'with "ざ"' do
          it { expect(word.send(:remove_dakuten_from_char, 'ざ')).to eq 'さ' }
        end

        context 'with "ぱ"' do
          it { expect(word.send(:remove_dakuten_from_char, 'ぱ')).to eq 'は' }
        end
      end
    end


    context '.new with "ルビー"' do
      let(:word) { Word.new('ルビー') }
      subject { word }

      describe '#name' do
        it { expect(word.name).to eq 'ルビー' }
      end

      describe '#furigana' do
        it { expect(word.furigana).to eq 'るびー' }
      end

      describe '#head' do
        it { expect(word.head).to eq 'る' }
      end

      describe '#last' do
        it { expect(word.last).to eq 'い' }
      end
    end

    context '.new with "機関車", "きかんしゃ"' do
      let(:word) { Word.new('機関車', 'きかんしゃ') }
      subject { word }

      describe '#name' do
        it { expect(word.name).to eq '機関車' }
      end

      describe '#furigana' do
        it { expect(word.furigana).to eq 'きかんしゃ' }
      end

      describe '#head' do
        it { expect(word.head).to eq 'き' }
      end

      describe '#last' do
        it { expect(word.last).to eq 'や' }
      end
    end

    context '.new with "漢字", "かんじ"' do
      let(:word) { Word.new('漢字', 'かんじ') }
      subject { word }

      describe '#name' do
        it { expect(word.name).to eq '漢字' }
      end

      describe '#furigana' do
        it { expect(word.furigana).to eq 'かんじ' }
      end

      describe '#head' do
        it { expect(word.head).to eq 'か' }
      end

      describe '#last' do
        it { expect(word.last).to eq 'し' }
      end
    end

    context '#new with "漢字"' do
      it { expect { Word.new('漢字', '漢字') }.to raise_error(StandardError) }
    end

    context '#new with "漢字", "漢字"' do
      it { expect { Word.new('漢字', '漢字') }.to raise_error(StandardError) }
    end
  end
end
