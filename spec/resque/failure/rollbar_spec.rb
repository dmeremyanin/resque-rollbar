require 'spec_helper'

describe Resque::Failure::Rollbar do
  it 'should be notified of an error' do
    exception = StandardError.new('BOOM')
    worker    = Resque::Worker.new(:test)
    queue     = 'test'
    payload   = { 'class' => Object, 'args' => 89 }

    expect(Rollbar).to receive(:report_exception).with(exception, payload)
    backend = Resque::Failure::Rollbar.new(exception, worker, queue, payload)
    backend.save

    expect(Rollbar.configuration.use_async).to be false
  end
end
