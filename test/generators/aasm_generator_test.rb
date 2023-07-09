# frozen_string_literal: true

require 'test_helper'

require 'generators/aasm/aasm_generator'

class AasmGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::AasmGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate aasm migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/add_aasm_state_to_documentos.rb', /def change/
  end
end
