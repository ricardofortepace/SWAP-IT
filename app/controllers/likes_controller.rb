class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @stuff = Stuff.find(params[:id])
    @like = Like.new
    @stuff.like = @like
  end

end
