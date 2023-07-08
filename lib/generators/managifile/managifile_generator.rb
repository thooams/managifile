# frozen_string_literal: true

require 'rails/generators/named_base'

module Managifile
  module Generators
    # Generate Managifile install
    class ManagifileGenerator < Rails::Generators::Base
      namespace 'managifile'
      class_option :mountable_engine, default: nil

      argument :name, type: :string, desc: 'Name of model (ex: user)'

      desc 'Generates a model with the given NAME (if one does not exist) with managifile'

      hook_for :orm, required: true, desc: 'ORM to be invoked'

      def install
        rails_command "aasm #{name}"
        rails_command 'active_storage:install'
        say "You must run 'rake db:migrate'!"
        # rails_command "db:migrate"
      end
    end
  end
end
