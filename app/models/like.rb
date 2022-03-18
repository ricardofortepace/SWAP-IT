class Like < ApplicationRecord
  attr_reader :chatroom

  after_create :create_chatroom
  after_update :create_chatroom
  belongs_to :stuff
  belongs_to :trading_stuff, class_name: 'Stuff'

  def create_chatroom
    match = Like.find_by(stuff: trading_stuff, trading_stuff: stuff)
    return unless match&.status && status

    @chatroom = Chatroom.create!(stuff: stuff, trading_stuff: trading_stuff)
  end
end
