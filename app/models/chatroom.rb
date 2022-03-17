class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :stuff
  belongs_to :trading_stuff, class_name: 'Stuff'
end
