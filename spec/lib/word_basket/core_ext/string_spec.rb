require 'spec_helper'
require 'word_basket/core_ext/string'

using WordBasket::StringExtension

describe String do
  context '"ひらがな"という文字を持つとき' do
    let(:str) { 'ひらがな' }

    describe '#include_hira_or_kata_only?'do
      it { expect(str.include_hira_or_kata_only?).to be_truthy }
    end

    describe '#include_hira_only?'do
      it { expect(str.include_hira_only?).to be_truthy }
    end
  end


  context '"ひらがなカタカナ"という文字を持つとき' do
    let(:str) { 'ひらがなカタカナ' }

    describe '#include_hira_or_kata_only?'do
      it { expect(str.include_hira_or_kata_only?).to be_truthy }
    end

    describe '#include_hira_only?'do
      it { expect(str.include_hira_only?).to be_falsy }
    end

    describe '#convert_to_hira' do
      it { expect(str.convert_to_hira).to eq 'ひらがなかたかな' }
    end
  end

  context '"かんじ漢字かんじ"という文字を持つとき' do
    let(:str) { 'かんじ漢字かんじ' }

    describe '#include_hira_or_kata_only?'do
      it { expect(str.include_hira_or_kata_only?).to be_falsy }
    end

    describe '#include_hira_only?'do
      it { expect(str.include_hira_only?).to be_falsy }
    end
  end

  context '"あーあー"という文字を持つとき' do
    let(:str) { 'あーあー' }

    describe '#include_hira_or_kata_only?'do
      it { expect(str.include_hira_or_kata_only?).to be_truthy }
    end

    describe '#include_hira_only?'do
      it { expect(str.include_hira_only?).to be_truthy }
    end
  end

  context '"あいうえおつやゆよぁぃぅぇぉっゃゅょ"という文字を持つとき' do
    let(:str) { 'あいうえおつやゆよぁぃぅぇぉっゃゅょ' }

    describe '#convert_to_seion' do
      it { expect(str.convert_to_seion).to eq 'あいうえおつやゆよあいうえおつやゆよ' }
    end
  end

  context '"かきくけこ"という文字を持つとき' do
    let(:str) { 'かきくけこ' }

    describe '#convert_to_boin' do
      it { expect(str.convert_to_boin).to eq 'あいうえお' }
    end
  end
end
