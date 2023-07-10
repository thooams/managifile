# frozen_string_literal: true

class DocumentPolicy < ApplicationPolicy
  attr_reader :user, :document

  def initialize(user, document)
    @user = user
    @document = document
  end

  def update?
    user_permissions.update?
  end

  def create?
    user_permissions.create?
  end

  def read?
    user_permissions.read?
  end

  def delete?
    user_permissions.delete?
  end

  alias show? read?
  alias destroy? delete?

  private

  def user_permissions
    @document.permissions.find_by(user: @user)
  end
end
