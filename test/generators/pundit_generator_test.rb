# frozen_string_literal: true

require 'test_helper'

require 'generators/pundit/pundit_generator'

class ManagifieGeneratorTest < Rails::Generators::TestCase
  tests Managifile::Generators::PunditGenerator
  destination File.expand_path('../tmp', __dir__)
  setup :prepare_destination

  test 'generate pundit application policy' do
    run_generator %w[documento]

    assert_file 'app/policies/application_policy.rb', /class ApplicationPolicy/
  end

  test 'generate pundit policy' do
    run_generator %w[documento]

    assert_file 'app/policies/documento_policy.rb', /class DocumentoPolicy < ApplicationPolicy/
  end
end
