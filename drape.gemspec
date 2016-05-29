# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'drape/version'

Gem::Specification.new do |s|
  s.name        = 'drape'
  s.version     = Drape::VERSION
  s.authors     = ['Andrew Emelianenko', 'Jeff Casimir', 'Steve Klabnik']
  s.email       = ['jeff@casimircreative.com', 'steve@steveklabnik.com']
  s.homepage    = 'http://github.com/drapegem/drape'
  s.summary     = 'View Models for Rails'
  s.description = 'Drape adds an object-oriented layer of presentation logic to your Rails apps.'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'activesupport', '>= 5.0.0.beta1'
  s.add_dependency 'actionpack', '>= 5.0.0.beta1'
  s.add_dependency 'request_store', '~> 1.0'
  s.add_dependency 'activemodel', '>= 5.0.0.beta1'
  s.add_dependency 'activemodel-serializers-xml', '>= 1.0'

  s.add_development_dependency 'rake', '>= 0.9.2'
  s.add_development_dependency 'rspec-rails', '>= 3.5.0.beta1'
  s.add_development_dependency 'minitest-rails', '>= 2.2.0'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'active_model_serializers'
end
