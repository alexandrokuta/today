class CommentsController < ApplicationController
  #before_action :set_picture

  def new
  end

  def create
   @comment = Comment.create(comment_params)
  end

private
  def comment_params
    params.require(:comment).permit(:text, :picture_id).merge(user_id: current_user.id)
  end

  #def set_picture
   # @picture = Picture.find(params[:id])
  #end

end




#

### def create
#    @comment = Comment.create(text: comment_params[:text], tweet_id: comment_params[:tweet_id], user_id: current_user.id)
#    respond_to do |format|
#      format.html { redirect_to tweet_path(params[:tweet_id])}
#      format.json
#  end#

#  private
#  def comment_params
#    params.permit(:text, :tweet_id)
#  end
#end

