class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 15 },
                      uniqueness: { scope: :user_id }
    validates :description, presence: true, length: { maximum: 400 }
end
