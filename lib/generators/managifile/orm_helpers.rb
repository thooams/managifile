# frozen_string_literal: true

module Managifile
  module Generators
    # Orm helpers for Managifile
    module OrmHelpers
      def model_contents
        <<RUBY
  include Managifile::ManagifileAttachable

  managifile_attachable attribute: :files
RUBY
      end

      private

      def model_exists?
        File.exist?(File.join(destination_root, model_path))
      end

      def model_path
        @model_path ||= File.join('app', 'models', "#{file_path}.rb")
      end
    end
  end
end
