# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_nf4web'
  s.version     = '2.1.7'
  s.summary     = 'Integration of nf4web.com.br and Spree Ecommerce'
  s.description = 'Nf4web is a brazilian service to issue invoices, according to the brazilian law, and Serasa regulations. This gem provides the required API to support the integration.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Alexandre Marangoni Costa'
  s.email     = 'alexandremcost@gmail.com'
  s.homepage  = 'http://github.com/alexandremcosta'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.7'

  s.add_development_dependency 'rspec-rails',  '~> 2.13'
end
