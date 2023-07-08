# frozen_string_literal: true

require 'test_helper'

require 'generators/active_record/managifile_generator'

class ActiveRecordGeneratorTest < Rails::Generators::TestCase
  tests ActiveRecord::Generators::ManagifileGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'all files are properly created with rails31 migration syntax' do
    run_generator %w[documento]
    # assert_migration "db/migrate/create_active_storage_tables.active_storage.rb", /def change/
    assert_migration 'db/migrate/add_aasm_state_to_documentos.rb', /def change/
  end

  test 'update model when model exists' do
    run_generator %w[documento]

    assert_file 'app/models/documento.rb'
  end

  test 'all files are properly deleted' do
    run_generator %w[documento], behavior: :revoke

    assert_no_file 'app/models/documento.rb'
  end
end
