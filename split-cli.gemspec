# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'split/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "split-cli"
  spec.version       = Split::Cli::VERSION
  spec.authors       = ["Craig McNamara"]
  spec.email         = ["craig@caring.com"]

  spec.summary       = %q{A CLI for the Split gem}
  spec.description   = %q{It's a bit odd, but I had my reasons.}
  spec.homepage      = "https://github.com/craigmcnamara/split-cli"
  spec.license       = "MIT"

  spec.metadata['allowed_push_host'] = 'http://rubygems.org'
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-autotest", '~> 4'

  spec.add_dependency "split", "~> 1.3"
end
