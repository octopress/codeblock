# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'octopress-codeblock/version'

Gem::Specification.new do |spec|
  spec.name          = "octopress-codeblock"
  spec.version       = Octopress::Codeblock::VERSION
  spec.authors       = ["Brandon Mathis"]
  spec.email         = ["brandon@imathis.com"]
  spec.description   = %q{Write beautiful code snippets within any template.}
  spec.summary       = %q{Write beautiful code snippets within any template.}
  spec.homepage      = "https://github.com/octopress/codeblock"
  spec.license       = "MIT"

  spec.add_runtime_dependency 'octopress-code-highlighter', '~> 4.2'

  spec.add_development_dependency 'jekyll'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'clash'

  spec.files         = `git ls-files -z`.split("\x0").grep(/^(bin\/|lib\/|assets\/|changelog|readme|license)/i)
  spec.require_paths = ["lib"]
end
