# frozen_string_literal: true

require 'test_helper'

require 'generators/permissions/permissions_generator'

class ManagifieGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::PermissionsGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate permissions migration' do
    run_generator %w[documento]

    assert_migration 'db/migrate/create_permissions.rb', /def change/
  end

  test 'generate permissions model' do
    run_generator %w[documento]

    assert_file 'app/models/permission.rb', /class Permission < ApplicationRecord/
  end
end
