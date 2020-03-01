# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'DRev/version'

Gem::Specification.new do |spec|
  spec.name          = 'DRev'
  spec.version       = DRev::VERSION
  spec.authors       = ['Dandush03']
  spec.email         = ['d.laloush@outlook.com']

  spec.summary       = 'Daniel Reviewer'
  spec.description   = 'This Gem Review CSS Errors (For Now!)'
  spec.homepage      = 'https://github.com/Dandush03/capstone-build-linter'
  spec.license       = 'MIT'

  # rubocop: disable Layout/LineLength
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  # rubocop: enable Layout/LineLength
  spec.bindir        = 'bin'
  spec.executables   = ['main']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency 'main'

  # spec.add_runtime_dependency "/bin/main.rb"
end
