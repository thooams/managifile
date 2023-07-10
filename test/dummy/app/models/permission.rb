# frozen_string_literal: true

# Permission model to model the rights of a user on a model
class Permission < ApplicationRecord
  # If array is empty, all rights are prohibited
  serialize :rights, Array

  DEFAULT_RIGHTS = %i[read create update delete].freeze

  # Relations
  belongs_to :user
  belongs_to :document

  # Scopes

  # Validations

  # Callbacks
  before_validation :set_default_rights, on: :create

  # Methods
  # Macros for rights
  # update?, delete?, create?, read?
  DEFAULT_RIGHTS.each do |right|
    define_method "#{right}?" do
      rights.include?(right)
    end
  end

  private

  # Set default rights to be database agnostic
  def set_default_rights
    self.rights = DEFAULT_RIGHTS if rights.blank?
  end
end
