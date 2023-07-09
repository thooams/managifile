# frozen_string_literal: true

require 'test_helper'

require 'generators/active_record/managifile_generator'

class ActiveRecordGeneratorTest < Rails::Generators::TestCase
  tests ActiveRecord::Generators::ManagifileGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'update model when model exists' do
    run_generator %w[documento]

    assert_file 'app/models/documento.rb'
  end
end
