require 'rubygems' unless Object.const_defined?(:Gem)
require File.dirname(__FILE__) + "/lib/active_direct/version"

Gem::Specification.new do |s|
  s.name        = "active_direct"
  s.version     = ActiveDirect::VERSION
  s.authors     = ["Stone Gao"]
  s.email       = "stones.gao at gmail.com"
  s.homepage    = "http://github.com/stonegao/active-direct"
  s.summary     = "ActiveDirect is a server-side implementation of Ext.Direct using Rack Middleware."
  s.description = "See README.rodc"
  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency 'spec'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'activesupport'
  s.add_dependency 'rails', '>= 2.3.5'
  s.files = Dir.glob(%w[{lib,spec}/**/*.{rb,opts} [A-Z]*.{txt,rdoc}]) + %w{Rakefile gemspec}
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE.txt"]
end
