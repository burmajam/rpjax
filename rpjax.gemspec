# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rpjax/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Milan Burmaja"]
  gem.email         = ["burmajam@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  # gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  # gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rpjax"
  gem.require_paths = ["lib"]
  gem.version       = Rpjax::VERSION
  
  gem.add_dependency "pjax_rails"
end
