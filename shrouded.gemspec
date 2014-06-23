# encoding: utf-8

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shrouded/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shrouded"
  s.version     = Shrouded::VERSION
  s.authors     = ["Inge Jørgensen"]
  s.email       = ["inge@elektronaut.no"]
  s.homepage    = "https://github.com/elektronaut/shrouded"
  s.summary     = "A file store for your Rails app"
  s.description = "Shrouded is a Rails plugin that stores your file uploads and other binary blobs."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "README.md"]

  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "fog", "~> 1.22.1"
  s.add_dependency "activejob"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.0.0"
end
