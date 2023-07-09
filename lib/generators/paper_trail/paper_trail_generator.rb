# frozen_string_literal: true

require 'rails/generators/named_base'

module Managifile
  module Generators
    # Generate Managifile install
    class PaperTrailGenerator < Rails::Generators::NamedBase
      def install_paper_trail
        log :generate, 'paper_trail:install'
        invoke 'paper_trail:install'
      end
    end
  end
end
