# frozen_string_literal: true

# Managifile module to manage your files
module Managifile
  # ManagifileAttachable module to manage your files
  module ManagifileAttachable
    extend ActiveSupport::Concern
    include ActiveModel::Validations

    class_methods do
      @@file_attribute = :files
      @@file_content_type = %i[pdf doc csv].freeze
      @@file_number_limit_max = 2
      @@file_number_limit_min = 0
      @@file_size_limit = 5_000_000 # ~= 5.megabytes

      ## Sets up the model to be able to manage files
      #
      # @example
      #  class Document < ApplicationRecord
      #    include Managifile::ManagifileAttachable
      #    managifile_attachable attribute: :files
      #    # or
      #    managifile_attachable attribute: :files, content_types: %i[pdf doc csv]
      #    # or
      #    managifile_attachable attribute: :files, content_types: %i[pdf doc csv],
      #                          number_limit_max: 2, number_limit_min: 0,
      #                          size_limit: 5_000_000
      #    end
      #
      #
      # @params attribute [Symbol] the attribute name to use for the files
      # @params content_types [Array] the content types to allow
      # @params number_limit_max [Integer] the maximum number of files allowed
      # @params number_limit_min [Integer] the minimum number of files allowed
      # @params size_limit [Integer] the maximum size of the files allowed
      # @return [void]
      def managifile_attachable(attribute: nil, content_types: nil,
                                number_limit_max: nil, number_limit_min: nil, size_limit: nil)
        cattr_accessor :file_attribute, default: attribute || @@file_attribute
        cattr_accessor :file_content_type, default: content_types || @@file_content_type
        cattr_accessor :file_number_limit_max, default: number_limit_max || @@file_number_limit_max
        cattr_accessor :file_number_limit_min, default: number_limit_min || @@file_number_limit_min
        cattr_accessor :file_size_limit, default: size_limit || @@file_size_limit
      end
    end

    included do
      # aasm_state for the model
      include AASM

      # Attach files to the model
      has_many_attached class_variable_get(:@@file_attribute)

      # Validation of
      validates class_variable_get(:@@file_attribute),
                content_type: class_variable_get(:@@file_content_type),
                size: { less_than: class_variable_get(:@@file_size_limit) },
                limit: { min: class_variable_get(:@@file_number_limit_min),
                         max: class_variable_get(:@@file_number_limit_max) }

      # Defined several states for the model
      aasm do
        state :draft, initial: true
        state :published
        state :shared

        event :publish do
          transitions from: :draft, to: :published
        end

        event :drafting do
          transitions from: %i[published shared], to: :draft
        end

        event :share do
          transitions from: %i[draft published], to: :shared
        end
      end
    end
  end
end
