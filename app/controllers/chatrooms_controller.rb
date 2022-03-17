class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end

end
