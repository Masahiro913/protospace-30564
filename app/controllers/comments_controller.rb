class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
      return
    end
    #@prototype = @comment.prototype
    #@comments = @prototype.comments
    #render "prototypes/index"
    redirect_to prototype_path(@comment.prototype)
  end
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
