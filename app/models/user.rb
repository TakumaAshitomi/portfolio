# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :subscription

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :user_profile, length: { maximum: 150 }

  enum role: { admin: 1, member: 2 }
end
