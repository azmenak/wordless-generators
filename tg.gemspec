# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tg/version'

Gem::Specification.new do |spec|
  spec.name          = "tg"
  spec.version       = Tg::VERSION
  spec.authors       = ["Adam Zmenak"]
  spec.email         = ["adam@dinteractive.ca"]
  spec.description   = %q{Interafce for building wordless templates}
  spec.summary       = %q{Makes my life slightly easier}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = ['tg']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
