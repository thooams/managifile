# frozen_string_literal: true

class Document < ApplicationRecord
  include Managifile::ManagifileAttachable

  managifile_attachable attribute: :files
end
