# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, :message, presence: true
end
