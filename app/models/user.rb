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
  validate :password_complexity

  enum role: { admin: 1, member: 2 }

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/

    errors.add :password, "パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字と特殊文字をそれぞれ1文字以上含める必要があります。"
  end
end
