# frozen_string_literal: true

require 'rails/generators/named_base'
require_relative '../active_storage/active_storage_generator'
require_relative '../aasm/aasm_generator'
require_relative '../paper_trail/paper_trail_generator'
require_relative '../pundit/pundit_generator'
require_relative '../permissions/permissions_generator'

module Managifile
  module Generators
    # Generate Managifile install
    class ManagifileGenerator < Rails::Generators::Base
      desc 'Generates a model with the given NAME (if one does not exist) with managifile'

      hook_for :orm, required: true, desc: 'ORM to be invoked'

      def install
        invoke Managifile::Generators::ActiveStorageGenerator
        invoke Managifile::Generators::AasmGenerator
        invoke Managifile::Generators::PaperTrailGenerator
        invoke Managifile::Generators::PunditGenerator
        invoke Managifile::Generators::PermissionsGenerator
      end
    end
  end
end
