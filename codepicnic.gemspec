# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codepicnic/version'

Gem::Specification.new do |spec|
  spec.name          = "codepicnic"
  spec.version       = CodePicnic::VERSION
  spec.authors       = ["Alvaro Pereyra"]
  spec.email         = ["alvaro@xendacentral.com"]

  spec.summary       = "Ruby Client for the CodePicnic's API."
  spec.description   = "Ruby Client for the CodePicnic's API."
  spec.homepage      = "https://github.com/codepicnic/codepicnic-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency     "rest-client", "~> 1.80"
end
