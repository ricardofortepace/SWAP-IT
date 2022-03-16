class User < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stuffs, dependent: :destroy
  has_one_attached :photo
  # has_many :messages, dependent: :destroy
  # has_many :matches, through: :stuffs, dependent: :destroy
  validates :name, :email, :address, presence: true
  # validates :range, inclusion: {in: 1..269}
end

#ricardo é
