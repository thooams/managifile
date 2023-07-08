# frozen_string_literal: true

require 'rails/generators/active_record'

module Managifile
  module Generators
    # Generate Managifile Permissions
    class PermissionsGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_model
        template 'permission.rb.erb', 'app/models/permission.rb'
      end

      def copy_migration
        migration_template 'migration.rb.erb', 'db/migrate/create_permissions.rb'
      end
    end
  end
end
