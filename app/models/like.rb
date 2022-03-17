class Like < ApplicationRecord
  after_create :create_chatroom
  belongs_to :stuff
  belongs_to :trading_stuff, class_name: 'Stuff'

  def create_chatroom
    like = Like.find_by(stuff: trading_stuff, trading_stuff: stuff)
    if like
      Chatroom.create!(stuff: stuff, trading_stuff: trading_stuff)
    end
  end
end
