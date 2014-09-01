# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'force_domain/version'

Gem::Specification.new do |spec|
  spec.name          = "force_domain"
  spec.version       = ForceDomain::VERSION
  spec.authors       = ["Aske Hansen"]
  spec.email         = ["aske@deeco.dk"]
  spec.summary       = "Rack middleware for forcing domain"
  spec.description   = "Rack middleware that will redirect all request that are not from the specified domain"
  spec.homepage      = "https://github.com/askehansen/force_domain"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
