# frozen_string_literal: true

require 'test_helper'

require 'generators/managifile/managifile_generator'

class ManagifieGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::ManagifileGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'update model when model exists' do
    run_generator %w[documento]

    assert_file 'app/models/documento.rb'
  end

  test 'all files are properly deleted' do
    run_generator %w[documento], behavior: :revoke

    assert_no_file 'app/models/documento.rb'
  end
end
