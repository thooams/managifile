# frozen_string_literal: true

require 'rails/generators/active_record'
require 'generators/managifile/orm_helpers'

module ActiveRecord
  module Generators
    # Generate managifile code for a model
    class ManagifileGenerator < ActiveRecord::Generators::Base
      include Managifile::Generators::OrmHelpers

      def generate_model
        invoke 'active_record:model', [name], migration: false unless model_exists? && behavior == :invoke
      end

      def inject_managifile_content
        content = model_contents

        class_path = if namespaced?
                       class_name.to_s.split('::')
                     else
                       [class_name]
                     end
        inject_into_class(model_path, class_path.last, content) if model_exists?
      end
    end
  end
end
