require 'resque'
require 'rollbar'

module Resque
  module Failure
    class Rollbar < Base
      def save
        ::Rollbar.error(exception, rollbar_payload)
      end

      def rollbar_payload
        payload.merge(:use_exception_level_filters => true)
      end
    end
  end
end
