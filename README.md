## Resque::Rollbar

[![Build Status](https://travis-ci.org/dimko/resque-rollbar.svg)](https://travis-ci.org/dimko/resque-rollbar)

Resque failure backend for reporting exceptions to [Rollbar](https://rollbar.com).

### Installation

Add this line to your application's Gemfile:

    gem 'resque-rollbar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install resque-rollbar

### Usage

In your resque's config:

```ruby
require 'resque/failure/multiple'
require 'resque/failure/redis'
require 'resque/rollbar'

Resque::Failure::Multiple.classes = [ Resque::Failure::Redis, Resque::Failure::Rollbar ]
Resque::Failure.backend = Resque::Failure::Multiple
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
