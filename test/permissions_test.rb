# frozen_string_literal: true

require 'test_helper'

class PermissionsTest < ActiveSupport::TestCase
  def test_permissions_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    document.permissions.create!(user:)
    permission = document.permissions.find_by(user:)

    assert_equal('read', permission.rights)
  end
end
