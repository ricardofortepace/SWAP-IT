class LikesController < ApplicationController
  def new
    @swap_stuff = Stuff.where.not(user: current_user).sample
    @my_stuffs = current_user.stuffs
    @like = Like.new
  end

  def create
    like = Like.new(like_params)
    like.stuff = Stuff.find(params[:like][:stuff])
    like.trading_stuff = Stuff.find(params[:like][:trading_stuff])
    like.save!
    redirect_to new_like_path
  end

  private

  def like_params
    params.require(:like).permit( :status )
  end
end
