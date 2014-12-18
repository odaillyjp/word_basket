lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'word_basket'

Gem::Specification.new do |spec|
  spec.name          = 'word_basket'
  spec.version       = WordBasket::VERSION
  spec.authors       = ['Suguru Odai']
  spec.email         = ['ourqwers@gmail.com']
  spec.summary       = %q{word_basket}
  spec.description   = %q{word_basket}
  spec.homepage      = 'https://github.com/odaillyjp/word_basket'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'firebase'
  spec.add_runtime_dependency 'moji'
  spec.add_runtime_dependency 'unf'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec'
end
