require_relative 'lib/the_postman/version'

Gem::Specification.new do |spec|
  spec.name          = "the_postman"
  spec.version       = ThePostman::VERSION
  spec.authors       = ["gonzoooooo"]
  spec.email         = ["7714010+gonzoooooo@users.noreply.github.com"]

  spec.summary       = "Post messages by any services"
  spec.description   = "Post messages by any services"
  spec.homepage      = "https://github.com/gonzoooooo/the_postman"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gonzoooooo/the_postman"
  spec.metadata["changelog_uri"] = "https://github.com/gonzoooooo/the_postman"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end
