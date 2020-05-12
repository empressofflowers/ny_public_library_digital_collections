require_relative 'lib/ny_public_library_digital_collections_cli/version'

Gem::Specification.new do |spec|
 spec.name          = "ny_public_library_digital_collections_cli"
 spec.version       = NYPLDC::VERSION
 spec.authors       = ["Devone L Austin"]
 spec.email         = ["devone.austin@gmail.com"]

 spec.summary       = %q{Prints to terminal poater from NY Public Library Digital Collections.}
 spec.homepage      = "https://github.com/empressofflowers/ny_public_library_digital_collections_cli.git"
 spec.license       = "MIT"
 spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

 spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

 spec.metadata["homepage_uri"] = spec.homepage
 spec.metadata["source_code_uri"] = "https://github.com/empressofflowers/ny_public_library_digital_collections_cli.git"
 spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  Specify which files should be added to the gem when it is released.
  The `git ls-files -z` loads the files in the RubyGem that have been added into git.
 spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
 end
 spec.bindir        = "exe"
 spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
 spec.require_paths = ["lib"]
end
