# frozen_string_literal: true

require 'test_helper'

require 'generators/paper_trail/paper_trail_generator'

class PapertrailGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::PaperTrailGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate paper_trail migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/create_versions.rb', /def change/
  end
end
