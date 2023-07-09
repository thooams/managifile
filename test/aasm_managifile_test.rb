# frozen_string_literal: true

require 'test_helper'

class AasmManagifileTest < ActiveSupport::TestCase
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
