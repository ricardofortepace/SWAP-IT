class LikesController < ApplicationController
  def new
    # ADICIONAR uma variavel para aplicar o range nos stuffs pertencentes somente aos usuarios proximos
    # @user_near = User.near(params[:address], params[:range]) if params[:address].present?

    @my_stuffs = current_user.stuffs.where(active: true)
    unless @my_stuffs&.present?
      redirect_to new_stuff_path, notice: "You still need to add some stuff to swap."
      return
    end

    if Stuff.where.not(user: current_user).empty?
      redirect_to root_path, notice: "Sorry, but we dont have stuffs for you swap."
      return
    end

    @swap_stuffs = Stuff.near(current_user.address, current_user.range).where.not(user: current_user).includes(:chatrooms).where(active: true, chatrooms: { id: nil })
    unless @swap_stuffs&.present?
      redirect_to root_path, notice: "Sorry, but we dont have stuffs in your range."
      return
    end

    @swap_stuff = @swap_stuffs.sample

    #  @swap_stuff = Stuff.where.not(user: current_user).sample

    @like = Like.new

    @selected_stuff_id = params[:stuff].present? ? params[:stuff] : @my_stuffs.first.id
  end

  def create
    # raise
    stuff = Stuff.find(params[:like][:stuff])
    trading_stuff = Stuff.find(params[:like][:trading_stuff])
    if Like.find_by(stuff: stuff, trading_stuff: trading_stuff)
      like = Like.find_by(stuff: stuff, trading_stuff: trading_stuff)
      like.status = params[:like][:status]
    else
      like = Like.new(like_params)
      like.stuff = stuff
      like.trading_stuff = trading_stuff
    end

    like.save!

    redirect_to new_like_path(chatroom_id: like.chatroom)

  end

  private

  def like_params
    params.require(:like).permit(:status)
  end
end
