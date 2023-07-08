# frozen_string_literal: true

require 'rails/generators/named_base'

module Managifile
  module Generators
    # Generate Managifile install
    class AasmGenerator < Rails::Generators::NamedBase
      require 'aasm'

      argument :name, type: :string

      def install_aasm
        log :generate, "aasm #{name}"
        invoke 'aasm', name
      end
    end
  end
end
