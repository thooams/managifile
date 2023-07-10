# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table(:permissions) do |t|
      t.belongs_to :user, index: true
      t.belongs_to :document, index: true
      t.text :rights, default: [].to_yaml
      t.timestamps null: false
    end
  end
end
