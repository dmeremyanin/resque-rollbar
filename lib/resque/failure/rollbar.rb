require 'resque'
require 'rollbar'

module Resque
  module Failure
    class Rollbar < Base
      def save
        ::Rollbar.notify_exception(exception, payload)
      end
    end
  end
end
