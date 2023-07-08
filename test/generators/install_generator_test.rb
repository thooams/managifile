# frozen_string_literal: true

require 'test_helper'

require 'generators/aasm/aasm_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::InstallGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate active_storage migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/add_aasm_state_to_documentos.rb', /def change/
  end
end
