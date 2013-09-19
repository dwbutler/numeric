# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
version = File.open(File.expand_path('../VERSION', __FILE__)).read

Gem::Specification.new do |spec|
  spec.name          = "numeric"
  spec.version       = version
  spec.authors       = ["David Butler"]
  spec.email         = ["dwbutler@ucla.edu"]
  spec.description   = %q{Adds numeric checking to Ruby}
  spec.summary       = %q{Adds numeric checking to Ruby}
  spec.homepage      = "https://github.com/dwbutler/numeric"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
