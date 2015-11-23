Gem::Specification.new do |s|
  s.name        = 'kappa-maki'
  s.version     = '0.0.4'
  s.date        = '2015-10-22'
  s.summary     = "Kappa Maki"
  s.description = "Provide Cucumber users the ability to create locally scoped step definitions and methods such that they are only usable from within one feature. In the style of Spinach."
  s.authors     = ["Allan Tokuda"]
  s.email       = 'praetis@gmail.com'
  s.files       = ["lib/kappa-maki.rb"]
  s.homepage    = 'http://rubygems.org/gems/kappa-maki'
  s.license     = 'MIT'
  s.add_runtime_dependency 'cucumber', '~> 2.0'
end
