require 'spec_helper'

describe Resque::Failure::Rollbar do
  it 'should be notified of an error' do
    exception = StandardError.new('BOOM')
    worker    = Resque::Worker.new(:test)
    queue     = 'test'
    payload   = { 'class' => Object, 'args' => 89 }

    Rollbar.should_receive(:notify_exception).with(exception, payload)
    backend = Resque::Failure::Rollbar.new(exception, worker, queue, payload)
    backend.save
  end
end
