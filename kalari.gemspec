# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kalari/version'

Gem::Specification.new do |spec|
  spec.name          = "kalari"
  spec.version       = Kalari::VERSION
  spec.authors       = ["Gareth Adams"]
  spec.email         = ["g@rethada.ms"]
  # spec.description   = %q{}
  spec.summary       = %q{A coding dojo in which programs can battle to the death}
  spec.homepage      = "https://github.com/gareth/kalari"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
