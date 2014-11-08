require 'spec_helper'
require 'word_basket/core_ext/string'

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
end
