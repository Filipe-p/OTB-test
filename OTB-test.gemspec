
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "OTB/version"

Gem::Specification.new do |spec|
  spec.name          = "OTB-test"
  spec.version       = OTB::Test::VERSION
  spec.authors       = ["Filipe Paiva"]
  spec.email         = ["filipe.p@soltroiavillas.com"]

  spec.summary       = %q{OTB job queue algorithem}
  spec.description   = %q{This gem organizes jobs according to it's dependencies. It takes in a string of jobs sperated by a commas and organizes them from 'a' tp 'z' according the dependencies.}
  spec.homepage      = "https://github.com/Filipe-p/OTB-test"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
end
