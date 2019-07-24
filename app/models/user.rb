class User < ApplicationRecord
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def admin?
    role == "admin"
  end
end
