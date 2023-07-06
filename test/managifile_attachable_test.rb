# frozen_string_literal: true

require 'test_helper'

class ManagifileAttachable < ActiveSupport::TestCase
  def test_document_file_attribute
    assert_equal :files, Document.file_attribute
  end

  def test_document_with_file
    document = Document.create!(name: 'My document')
    document.files.attach(io: File.open("#{Rails.root}/files/test.csv"), filename: 'test.csv')
    document.files.attach(io: File.open("#{Rails.root}/files/test.doc"), filename: 'test.doc')
    document.files.attach(io: File.open("#{Rails.root}/files/test.pdf"), filename: 'test.pdf')

    assert_equal 3, document.files.count
  end

  def test_non_manage_file_content
    document = Document.create!(name: 'My document')
    document.files.attach(io: File.open("#{Rails.root}/files/test.jpeg"), filename: 'test.jpeg')

    puts document.reload.files

    assert_empty document.files
  end

  def test_allowing_content_type
    matcher = ActiveStorageValidations::Matchers::ContentTypeValidatorMatcher.new(:files).allowing('pdf', 'doc', 'csv')

    assert matcher.matches?(Document)
  end

  def test_rejecting_content_type
    matcher = ActiveStorageValidations::Matchers::ContentTypeValidatorMatcher.new(:files).allowing('jpg', 'gif', 'png')

    refute matcher.matches?(Document)
  end

  def test_positive_match_less_than
    matcher = ActiveStorageValidations::Matchers::SizeValidatorMatcher.new(:files)
    matcher.less_than 5_000_000

    assert matcher.matches?(Document)
  end

  def test_aasm_state_by_default
    document = Document.create!(name: 'My document')

    assert_equal 'draft', document.aasm_state
  end

  def test_aasm_transition_to_published
    document = Document.create!(name: 'My document')
    document.publish!

    assert_equal 'published', document.aasm_state
  end

  def test_aasm_transition_to_draft
    document = Document.create!(name: 'My document')
    document.publish!
    document.drafting!

    assert_equal 'draft', document.aasm_state
  end

  def test_aasm_transition_to_shared
    document = Document.create!(name: 'My document')
    document.publish!
    document.share!

    assert_equal 'shared', document.aasm_state
    refute_event_allowed document, :published
  end

  def test_aasm_refute_transition_to_published
    document = Document.create!(name: 'My document')
    document.publish!

    assert_equal 'published', document.aasm_state
    refute_event_allowed document, :published
  end
end
