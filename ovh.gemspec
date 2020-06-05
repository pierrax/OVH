
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ovh/version"

Gem::Specification.new do |spec|
  spec.name          = "ovh"
  spec.version       = Ovh::VERSION
  spec.authors       = ["Sebastian"]
  spec.email         = ["sebastian.johnsson@gmail.com"]

  spec.summary       = %q{OVH Ruby HTTP API Client}
  spec.description   = %q{Ruby client to interact with OVH's API}
  spec.homepage      = "https://github.com/SebastianJ/ovh"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "faraday", '~> 1.0.1'
  spec.add_dependency "faraday_middleware",     ">= 1.0.0"

  spec.add_development_dependency "bundler",    "~> 1.16.2"
  spec.add_development_dependency "rake",       "~> 12.3.1"
  spec.add_development_dependency "rspec",      "~> 3.7.0"
  spec.add_development_dependency "rdoc",       "~> 6.0.4"
  spec.add_development_dependency "vcr",        "~> 4.0"
  spec.add_development_dependency "webmock",    "~> 3.4.2"
  spec.add_development_dependency "pry",        "~> 0.11.3"
end
