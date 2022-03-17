class LikesController < ApplicationController
  def new
    # ADICIONAR uma variavel para aplicar o range nos stuffs pertencentes somente aos usuarios proximos
    # @user_near = User.near(params[:address], params[:range]) if params[:address].present?

    if current_user.stuffs.empty?
    redirect_to new_stuff_path, notice: "You still need to add some stuff to swap."
      return
    end

    if Stuff.where.not(user: current_user).empty?
      redirect_to root_path, notice: "Sorry, but we dont have stuffs for you swap."
      return
    end

    if Stuff.near(current_user.address, current_user.range).where.not(user: current_user).empty?
      redirect_to root_path, notice: "Sorry, but we dont have stuffs in your range."
      return
    end

    @swap_stuff = Stuff.near(current_user.address, current_user.range).where.not(user: current_user).sample

    # @swap_stuff = Stuff.where.not(user: current_user).sample

    @my_stuffs = current_user.stuffs
    @like = Like.new
    @selected_stuff_id = params[:selected_stuff_id].present? ? params[:selected_stuff_id] : @my_stuffs.first.id
  end

  def create

    like = Like.new(like_params)
    stuff = Stuff.find(params[:like][:stuff])
    trading_stuff = Stuff.find(params[:like][:trading_stuff])
    like.stuff = stuff
    like.trading_stuff = trading_stuff
    like.save!

    redirect_to new_like_path

  end

  private

  def like_params
    params.require(:like).permit(:status)
  end
end
