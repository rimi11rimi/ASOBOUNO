class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :validatable

   has_many :plays, dependent: :destroy
   has_many :likes, dependent: :destroy
   has_many :liked_plays, through: :likes, source: :play
   has_many :comments, dependent: :destroy
   has_many :plays, dependent: :destroy
   validates :name, presence: true
   validates :profile, length: { maximum: 200 }
   mount_uploader :image, ImageUploader

   def already_liked?(play)
    self.likes.exists?(play_id: play.id)
  end
end
