# frozen_string_literal: true

require 'rails/generators/active_record'
require 'aasm'

module Managifile
  module Generators
    # Generate Managifile install
    class AasmGenerator < ActiveRecord::Generators::Base
      def install_aasm
        log :generate, "active_record:aasm #{name}"
        invoke 'active_record:aasm', [name]
      end
    end
  end
end
