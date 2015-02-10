require 'resque'
require 'rollbar'

module Resque
  module Failure
    class Rollbar < Base
      def save
        if use_exception_level_filters?
          payload_with_options = payload.merge(:use_exception_level_filters => true)
        else
          payload_with_options = payload
        end

        ::Rollbar.error(exception, payload_with_options)
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
