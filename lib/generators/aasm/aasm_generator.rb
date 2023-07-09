# frozen_string_literal: true

require 'rails/generators/named_base'

module Managifile
  module Generators
    # Generate Managifile install
    class AasmGenerator < Rails::Generators::NamedBase
      def install_aasm
        log :rails_command, "aasm #{name}"
        invoke 'active_record::aasm', [name]
      end
    end
  end
end
