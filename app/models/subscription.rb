# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true,
                      uniqueness: { scope: :followed_id }
  validates :followed_id, presence: true
end
