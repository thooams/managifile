# frozen_string_literal: true

require 'rails/generators/active_record'

module Managifile
  module Generators
    # Generate Pundit install
    class PunditGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def install_pundit
        log :generate, 'pundit:install'
        invoke 'pundit:install'
      end

      def copy_policy
        template 'resource_policy.rb.erb', "app/policies/#{name.downcase}_policy.rb"
      end
    end
  end
end
