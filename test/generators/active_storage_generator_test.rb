# frozen_string_literal: true

require 'test_helper'

require 'generators/active_storage/active_storage_generator'

class ActiveStorageGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::ActiveStorageGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate active_storage migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/create_active_storage_tables.rb', /def change/
  end
end
