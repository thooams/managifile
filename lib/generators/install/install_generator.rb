# frozen_string_literal: true

require 'rails/generators/active_record'

module Managifile
  module Generators
    # Generate Managifile install
    class InstallGenerator < ActiveRecord::Generators::Base
      desc 'Installs Managifile and generates the necessary migrations'
      argument :name, type: :string

      def install
        rails_command 'active_storage:install'
      end
    end
  end
end
