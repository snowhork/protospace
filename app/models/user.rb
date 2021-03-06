class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :prototypes, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :prototypes

  validates :nickname, presence: true

  mount_uploader :avatar, AvatarUploader
end
