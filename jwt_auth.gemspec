# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jwt_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "jwt_auth"
  spec.version       = JwtAuth::VERSION
  spec.authors       = ["Jerk"]
  spec.email         = ["jerk@gmail.com"]
  spec.summary       = %q{jwt authentice}
  spec.description   = %q{jwt authentice the token}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
