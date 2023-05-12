Gem::Specification.new do |spec|
  spec.name          = "weblambda"
  spec.version       = "0.1"
  spec.authors       = ["Ahmet Cetinkaya"]
  spec.email         = ["cetinkayaahmet@yahoo.com"]
  spec.files         = ["lib/weblambda.rb"]
  spec.summary       = "Create web forms from lambdas."
  spec.description   = "weblambda is a Ruby Sinatra extension that helps you create web forms from given anonymous functions (lambdas)."
  spec.homepage      = "https://github.org/cetinkaya/weblambda"
  spec.license       = "GPL-3.0"
  spec.add_dependency 'sinatra'
end
