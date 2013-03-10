require 'resque'
require 'rollbar'

module Resque
  module Failure
    class Rollbar < Base
      def save
        ::Rollbar.notify_exception exception, {
          :payload_class => payload['class'].to_s,
          :payload_args => payload['args'].inspect
        }
      end
    end
  end
end
