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

  spec.add_dependency 'aasm', '~> 5.5.0'
  spec.add_dependency 'active_storage_validations', '~> 1.0.4'
  spec.add_dependency 'aws-sdk-s3', '~> 1.128.0'
  spec.add_dependency 'paper_trail', '~> 14.0.0'
  spec.add_dependency 'pundit', '~> 2.3.0'
  spec.add_dependency 'rails', '>= 7.0.5'

  # Development dependencies
  spec.metadata['rubygems_mfa_required'] = 'true'
end
