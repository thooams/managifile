# frozen_string_literal: true

require 'test_helper'

class PermissionsTest < ActiveSupport::TestCase
  def test_permissions_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    document.permissions.create!(user:)
    permission = document.permissions.find_by(user:)

    assert_equal(%i[read create update delete], permission.rights)
  end

  def test_permissions_only_read_and_create_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    document.permissions.create!(user:, rights: %i[read create])
    permission = document.permissions.find_by(user:)

    assert_equal(%i[read create], permission.rights)
  end

  def test_permissions_with_no_rights_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    document.permissions.create!(user:)
    permission = document.permissions.find_by(user:)
    permission.update!(rights: [])

    assert_empty(permission.rights)
  end
end
