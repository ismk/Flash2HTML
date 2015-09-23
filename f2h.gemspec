# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'f2h/version'

Gem::Specification.new do |spec|
  spec.name          = "f2h"
  spec.version       = F2h::VERSION
  spec.authors       = ["Ismail Kalimi"]
  spec.email         = ["ismailkalimi@gmail.com"]

  spec.summary       = %q{Generates boilerplate code for HTML5 creatives from Flash files}
  spec.description   = %q{Boilerplate code that provides sane default settings when making html5 assets using html,css and js from Flash creatives}
  spec.homepage      = "https://github.com/ismk/Flash2HTML"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ["f2h"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rmagick"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
