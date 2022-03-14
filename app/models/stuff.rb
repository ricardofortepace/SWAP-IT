class Stuff < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :trading_likes, foreign_key: :trading_stuff_id
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_many :matches
  validates :name, :description, :photos, presence: true
end
