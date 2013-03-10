# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque/failure/rollbar/version'

Gem::Specification.new do |gem|
  gem.name          = 'resque-rollbar'
  gem.version       = Resque::Failure::Rollbar::VERSION
  gem.authors       = ['Dimko']
  gem.email         = ['deemox@gmail.com']
  gem.description   = 'Resque failure backend for rollbar.com'
  gem.summary       = 'Resque failure backend for rollbar.com'
  gem.homepage      = 'https://github.com/dimko/resque-rollbar'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'resque'
  gem.add_dependency 'rollbar'

  gem.add_development_dependency 'rspec', '~> 2.5'
end
