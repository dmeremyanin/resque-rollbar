require 'resque'
require 'rollbar'

module Resque
  module Failure
    class Rollbar < Base
      def save
        ::Rollbar.error(exception, rollbar_payload)
      end

      def rollbar_payload
        if use_exception_level_filters?
          payload.merge(:use_exception_level_filters => true)
        else
          payload
        end
      end

      def use_exception_level_filters?
        rollbar_version.split('.')[1].to_i > 3
      end

      def rollbar_version
        ::Rollbar::VERSION
      end
    end
  end
end
