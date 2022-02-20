class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_chat_rooms
  has_many :message_rooms, through: :user_chat_rooms
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  def follow(other_user)
    if self == other_user
      raise "[follow] self and other_user is same"
    end
    Rails.logger.debug "[follow] follow from=#{self.id}, to=#{other_user.id}"
    relationships.find_or_create_by!(follower: other_user)
  end

  def following?(user)
    followings.where(id: user.id).exists?
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end
  
  validates :name, presence: true

  enum user_style: { トレーナー: 0, トレーニー: 1 }

  mount_uploader :image, ImageUploader
end
