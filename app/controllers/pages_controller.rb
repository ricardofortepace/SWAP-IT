class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def about_us
  end

  def file
    @stuffs = current_user.stuffs.all.where(active: false)
  end

end
