class StuffsController < ApplicationController

  before_action :set_stuff, only: %i[show edit update destroy]

  def new
    @stuff = Stuff.new
  end

  def create
    @stuff = Stuff.new(stuff_params)
    @stuff.user = current_user

    if @stuff.save
      redirect_to stuff_path(@stuff), notice: 'Stuff created.'
    else
      render :new
    end
  end

  def show
    @like = Like.new
  end

  def edit
  end

  def update
    if @stuff.update(stuff_params)
      redirect_to @stuff, notice: 'Stuff updated!'
    else
      render :edit
    end
  end

  def destroy
    stuff = Stuff.find(params[:id])
    stuff.destroy

    redirect_to edit_user_registration_path, notice: 'Stuff gone!'
  end

  private

  def set_stuff
    @stuff = Stuff.find(params[:id])
  end

  def stuff_params
    params.require(:stuff).permit(:name, :description, photos: [])
  end
end
