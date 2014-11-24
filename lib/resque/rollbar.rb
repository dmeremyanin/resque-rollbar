require 'resque/failure/rollbar'

Resque.before_first_fork do
  # Force synchronous reporting
  ::Rollbar.configure do |config|
    config.use_async = false
  end
  ::Rollbar.reset_notifier!
end
