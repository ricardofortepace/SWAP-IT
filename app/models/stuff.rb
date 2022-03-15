class Stuff < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_many :matches
  validates :name, :description, :photos, presence: true
end
