# frozen_string_literal: true

require_relative 'lib/managifile/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 3.2.0'
  spec.name        = 'managifile'
  spec.version     = Managifile::VERSION
  spec.authors     = ['Thomas HUMMEL']
  spec.email       = ['thomas@hummel.link']
  spec.homepage    = 'https://github.com/thooams/managifile'
  spec.summary     = 'Manage your files with Managifile.'
  spec.description = 'This Gem allow yout to manage your file quickly with a restrictions, statuses, version, ...'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/thooams/managifile'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.5'

  # Development dependencies
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-ast'
  spec.add_development_dependency 'rubocop-minitest'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rails'
end
