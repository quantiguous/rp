$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rp"
  s.version     = Rp::VERSION
  s.authors     = ["divyajayan"]
  s.email       = ["divya.jayan@quantiguous.com"]
  s.homepage    = "http://rubygems.org/gems/rp"
  s.summary     = "Customized report builder"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'haml-rails'
end
