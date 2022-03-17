class Like < ApplicationRecord
  attr_reader :chatroom
  after_create :create_chatroom
  belongs_to :stuff
  belongs_to :trading_stuff, class_name: 'Stuff'

  def create_chatroom
    match = Like.find_by(stuff: trading_stuff, trading_stuff: stuff)
    if match
      @chatroom = Chatroom.create!(stuff: stuff, trading_stuff: trading_stuff)
    end
  end
end
