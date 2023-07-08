# frozen_string_literal: true

require 'test_helper'

require 'generators/managifile/managifile_generator'

class ManagifieGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::ManagifileGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate active storage migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/create_active_storage_tables.active_storage.rb', /def change/
  end

  test 'generate aasm migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/add_aasm_state_to_documentos.rb', /def change/
  end

  #
  # test "update model when model exists" do
  #   run_generator %w(documento)
  #   assert_file "app/models/documento.rb"
  # end
  #
  # test "all files are properly deleted" do
  #   run_generator %w(documento), behavior: :revoke
  #   assert_no_file "app/models/documento.rb"
  # end
end
