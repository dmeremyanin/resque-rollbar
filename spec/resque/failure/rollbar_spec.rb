require 'spec_helper'

describe Resque::Failure::Rollbar do
  let(:exception) { StandardError.new('BOOM') }
  let(:worker) { Resque::Worker.new(:test) }
  let(:queue) { 'test' }
  let(:payload) { { 'class' => Object, 'args' => 89 } }
  let(:backend) do
    Resque::Failure::Rollbar.new(exception, worker, queue, payload)
  end

  it 'should be notified of an error' do
    expect(Rollbar.notifier).to receive(:log).with('error', exception, payload)
    backend.save
  end

  context 'with Rollbar version > 1.3' do
    let(:rollbar_payload) { payload.merge(:use_exception_level_filters => true) }

    before do
      allow(backend).to receive(:rollbar_version).and_return('1.4.0')
    end

    it 'sends the :use_exception_level_filters option' do
      expect(Rollbar.notifier).to receive(:error).with(exception, rollbar_payload)
      backend.save
    end
  end
end
