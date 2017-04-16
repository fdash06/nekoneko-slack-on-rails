$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "nekoneko-slack-on-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "nekoneko-slack-on-rails"
  s.version     = NekonekoSlackOnRails::VERSION
  s.authors     = ["fdash"]
  s.email       = ["sfukuda.fdash@gmail.com"]
  s.homepage    = "https://github.com/fdash06/nekoneko-slack-on-rails"
  s.summary     = "Slack clients for rails."
  s.description = "Support multiple slack clients for Ruby on Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "slack-ruby-client"
  s.add_dependency "eventmachine"
  s.add_dependency "faye-websocket"

  s.add_development_dependency "sqlite3"
end
