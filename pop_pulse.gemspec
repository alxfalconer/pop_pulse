require_relative 'lib/pop_pulse/version'

Gem::Specification.new do |spec|
  spec.name          = "pop_pulse"
  spec.version       = PopPulse::VERSION
  spec.authors       = ["Alexander"]
  spec.email         = ["al.x.falconer@gmail.com"]

  spec.summary       = "Exploring Kanye's discography"
  spec.homepage      = "https://github.com/alxfalconer/pop_pulse.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alxfalconer/pop_pulse.git"
  spec.metadata["changelog_uri"] = "https://github.com/alxfalconer/pop_pulse/blob/master/CHANGELOG.md"

  # Specif whic fil shoul be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
end
