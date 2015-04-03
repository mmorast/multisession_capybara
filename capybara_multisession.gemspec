# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara_multisession/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara_multisession"
  spec.version       = CapybaraMultisession::VERSION
  spec.authors       = ["Monte Morast"]
  spec.email         = ["monte.morast@peopleadmin.com"]
  spec.summary       = %q{Provide DSL to simplify working with multiple Capybara sessions}
  spec.description   = %q{Provide DSL to simplify working with multiple Capybara sessions}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "minitest", '~> 5.5.1'
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "minitest-line"
  spec.add_development_dependency "minitest-capybara"

end
