class User < ApplicationRecord
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  mount_uploader :avatar, AvatarUploader
  
  validates :name, presence: true
  
  enum role: { admin: 1, member: 2 }
end
