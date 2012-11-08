# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markup_model/version'

Gem::Specification.new do |gem|
  gem.name          = "markup_model"
  gem.version       = MarkupModel::VERSION
  gem.authors       = ["Brian Alexander"]
  gem.email         = ["balexand@gmail.com"]
  gem.description   = %q{Under construction}
  gem.summary       = %q{Under construction}
  gem.homepage      = "https://github.com/balexand/markup_model"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'supermodel'
end
