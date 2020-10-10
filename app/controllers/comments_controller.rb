class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments.create(comments_parameters)
    if @comments.save
      redirect_to prototype_path(@comments.prototype.id)
    else
      render "prototype/show"
    end
  end

  private

  def comments_parameters
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
