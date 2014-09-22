require 'spec_helper'

describe Rollbar do
  describe '#configuration' do
    let(:configuration) { described_class.configuration }

    describe '#use_async' do
      subject { configuration.use_async }
      it { is_expected.to be false }
    end
  end
end
