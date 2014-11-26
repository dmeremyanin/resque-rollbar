require 'resque'
require 'rollbar'

module Resque
  module Failure
    class Rollbar < Base
      def save
        ::Rollbar.error(exception, payload)
      end
    end
  end
end
