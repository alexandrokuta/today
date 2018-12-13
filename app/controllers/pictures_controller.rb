class PicturesController < ApplicationController
  before_action :move_to_index
  before_action :set_picture, only: [:destroy, :edit]

  def index
    @pictures = Picture.includes(:user).page(params[:page]).per(5).order('created_at DESC')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.create(create_params)
    redirect_to :root
  end

  def destroy
       @picture.destroy if current_user.id == @picture.id
  end

  private
  def create_params
    params.require(:picture).permit(:text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to :user_session_path unless user_signed_in?
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

end
