# frozen_string_literal: true

require 'rails/generators/active_record'
require 'active_storage/engine'

module Managifile
  module Generators
    # Generate Active Storage install
    class ActiveStorageGenerator < ActiveRecord::Generators::Base
      def install_active_storage
        log :rails_command, 'active_storage:install'
        rails_command 'active_storage:install'
      end
    end
  end
end
