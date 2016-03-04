require 'resque/failure/rollbar'

Resque.before_first_fork do
  ::Rollbar.configure { |c| c.use_async = false } # Force synchronous reporting
  ::Rollbar.reset_notifier!
end
