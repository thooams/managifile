# frozen_string_literal: true

require 'test_helper'

class PunditManagifileTest < ActiveSupport::TestCase
  def test_pundit_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    document.permissions.create!(user:)
    document_policy = DocumentPolicy.new(user, document)

    assert_predicate document_policy, :read?
    assert_predicate document_policy, :delete?
    assert_predicate document_policy, :create?
    assert_predicate document_policy, :update?
    assert_predicate document_policy, :show?
    assert_predicate document_policy, :destroy?
  end

  def test_permissions_refute_persmissions_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    permission = document.permissions.create!(user:)
    permission.update!(rights: [])
    document_policy = DocumentPolicy.new(user, document)

    refute_predicate document_policy, :read?
    refute_predicate document_policy, :delete?
    refute_predicate document_policy, :create?
    refute_predicate document_policy, :update?
    refute_predicate document_policy, :show?
    refute_predicate document_policy, :destroy?
  end

  def test_permissions_only_create_for_user
    user = User.create!(email: 'test@test.fr')
    document = Document.create!(name: 'My document')
    permission = document.permissions.create!(user:)
    permission.update!(rights: [:create])
    document_policy = DocumentPolicy.new(user, document)

    refute_predicate document_policy, :read?
    refute_predicate document_policy, :delete?
    assert_predicate document_policy, :create?
    refute_predicate document_policy, :update?
    refute_predicate document_policy, :show?
    refute_predicate document_policy, :destroy?
  end
end
