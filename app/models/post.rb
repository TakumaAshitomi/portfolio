# frozen_string_literal: true

class Post < ApplicationRecord
  include PublicActivity::Common
  acts_as_taggable

  belongs_to :user
  has_many :hebutton, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 },
                    uniqueness: { scope: :user_id }

  validates :description, presence: true, length: { maximum: 2000 },
                          exclusion: { in: %w[script] }
end
