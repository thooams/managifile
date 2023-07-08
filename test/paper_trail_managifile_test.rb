# frozen_string_literal: true

require 'test_helper'

class PaperTrailManagifileTest < ActiveSupport::TestCase
  def test_version_of_document
    document = Document.create!(name: 'My document')

    assert_equal 1, document.versions.count
  end

  def test_add_files_to_document
    document = Document.create!(name: 'My document')
    document.files.attach(io: File.open("#{Rails.root}/files/test.csv"), filename: 'test.csv')

    assert_equal 2, document.versions.count
  end

  def test_update_name_to_document
    document = Document.create!(name: 'My document')
    document.update(name: 'My document updated')

    assert_equal 2, document.versions.count
  end
end
