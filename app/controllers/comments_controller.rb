class CommentsController < ApplicationController
  before_filter :authenticate_user!


  def destroy
    comment = Comment.find_by_id(params[:id])
    
    if comment.user.id == current_user.id
      comment.disable
      comment.save
    end
    redirect_to request.referer
  end
end
