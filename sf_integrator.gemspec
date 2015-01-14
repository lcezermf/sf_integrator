# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sf_integrator/version'

Gem::Specification.new do |spec|
  spec.name          = "sf_integrator"
  spec.version       = SfIntegrator::VERSION
  spec.authors       = ["Luiz Cezer"]
  spec.email         = ["lccezinha@gmail.com"]
  spec.summary       = %q{TODO: Integration with Sales Force leads. }
  spec.description   = %q{TODO: Integration with Sales Force leads. }
  spec.homepage      = "http://github.com/lccezinha/sf_integrator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
