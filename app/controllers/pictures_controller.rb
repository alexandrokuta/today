class PicturesController < ApplicationController

  def index
    @pictures = Picture.includes(:user).order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(create_params)
    redirect_to :root
  end

  private
  def create_params
    params.require(:picture).permit(:text, :image).merge(user_id: current_user.id)
  end

end
