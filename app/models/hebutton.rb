# frozen_string_literal: true

class Hebutton < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true, uniqueness: { scope: :post_id }
  validates :post_id, presence: true, uniqueness: { scope: :user_id }
end
