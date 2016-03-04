require 'spec_helper'

describe Resque::Failure::Rollbar do
  let(:exception) { StandardError.new('BOOM') }
  let(:worker) { Resque::Worker.new(:test) }
  let(:queue) { 'test' }
  let(:payload) { { 'class' => Object, 'args' => 89 } }
  let(:backend) do
    Resque::Failure::Rollbar.new(exception, worker, queue, payload)
  end

  describe '#save' do
    it 'notifies Rollbar about the error' do
      expect(Rollbar.notifier).to receive(:error).with(exception, backend.rollbar_payload)
      backend.save
    end
  end

  describe '#rollbar_payload' do
    it 'returns the payload with use_exception_level_filters set to true' do
      expect(backend.rollbar_payload).to eq payload.merge(:use_exception_level_filters => true)
    end
  end
end
