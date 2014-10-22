require 'spec_helper'

module WordBasket::Database
  RSpec.shared_examples 'a database strategy' do |klass|
    let(:database) { klass.new }
    subject { database }

    it { is_expected.to be_respond_to(:set) }
    it { is_expected.to be_respond_to(:sample) }
  end
end
