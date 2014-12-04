require 'spec_helper'

describe 'resque-rollbar' do
  describe Resque, :before_first_fork do
    context 'when Rollbar has been configured to use resque' do
      before do
        Rollbar.configure do |config|
          config.use_resque
        end

        Resque.before_first_fork.each do |hook|
          hook.call
        end
      end

      it 'disables asyc reporting from the resque process' do
        expect(Rollbar.configuration.use_async).to be_falsey
      end
    end

    context 'when a notifier has been created prior to configuration' do
      let!(:unconfigured_notifier) { Rollbar.notifier }

      before do
        Rollbar.configure do |config|
          config.use_resque
        end

        Resque.before_first_fork.each do |hook|
          hook.call
        end
      end

      it 'resets the notifier' do
        expect(unconfigured_notifier).to be
        expect(Rollbar.notifier).not_to be(unconfigured_notifier)
      end
    end
  end
end
