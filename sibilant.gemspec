# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sibilant/version'

Gem::Specification.new do |spec|
  spec.name          = "sibilant"
  spec.version       = Sibilant::VERSION
  spec.authors       = ["Jacob Rothstein"]
  spec.email         = ["hi@jbr.me"]
  spec.description   = %q{Ruby wrapper using ExecJS for the sibilant compiler}
  spec.summary       = %q{}
  spec.homepage      = "http://sibilantjs.info"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/) +
                       `cd js/sibilant; git ls-files`.split($/).map {|file| "js/sibilant/#{file}"}

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
