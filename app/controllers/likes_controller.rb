class LikesController < ApplicationController
  def new
    # ADICIONAR uma variavel para aplicar o range nos stuffs pertencentes somente aos usuarios proximos
    # @user_near = User.near(params[:address], params[:range]) if params[:address].present?
    redirect_to new_stuff_path, notice: "you still need to add some stuff to swap." if current_user.stuffs.empty?
    @swap_stuff = Stuff.where.not(user: current_user).sample
    # dentro dos swap_stuff somente os que satisfazem o range preestabelecido
    @my_stuffs = current_user.stuffs
    @like = Like.new
  end

  def create
    like = Like.new(like_params)
    like.stuff = Stuff.find(params[:like][:stuff])
    like.trading_stuff = Stuff.find(params[:like][:trading_stuff])
    like.save!
    @chat = Chatroom.new(name: like.stuff.name)
    @chat.save
    redirect_to chatroom_path(@chat)
  end

  private

  def like_params
    params.require(:like).permit(:status)
  end
end
