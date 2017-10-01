# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tzispa/annotations/version"

Gem::Specification.new do |spec|
  spec.name          = "tzispa_annotations"
  spec.version       = Tzispa::Annotations::VERSION
  spec.authors       = ["Juan Antonio Piñero"]
  spec.email         = ["japinero@area-integral.com"]

  spec.summary       = 'methods annotation in ruby'
  spec.homepage      = "https://github.com/japiber/tzispa_annotations"
  spec.license       = "MIT"

  spec.files         = Dir['{lib}/**/*', '{test}/**/*'] +
                       %w(README.md CHANGELOG.md LICENSE.txt CODE_OF_CONDUCT.md)
  spec.require_paths = %w(lib test)

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
