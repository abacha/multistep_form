require "#{File.dirname(__FILE__)}/lib/version.rb"

Gem::Specification.new do |s|
  s.name    = "multistep_form"
  s.version = MultistepForm::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Adriano Bacha"]
  s.email = ["abacha@gmail.com"]
  s.homepage = "http://github.com/abacha/multistep_form"
  s.summary = "build form on many steps using only one controller method"
  s.description = "build form on many steps using only one controller method"
  s.files = Dir.glob("{lib}/**/*") + %w(README.md)
  s.require_path = 'lib'
  s.required_ruby_version = ">= 1.9.3"
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "multistep_form"
end
