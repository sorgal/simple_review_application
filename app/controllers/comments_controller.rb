class CommentsController < ApplicationController

  layout false

  def create
    @comment = Comment.new(create_params.merge(user: current_user))
    @comment.creation(params[:rating_value])
    if @comment.new_record?
      flash.now[:error] = @comment.errors.present? ? @comment.errors.full_messages.join(' ') : t('.error')
    else
      flash.now[:notice] = t('.notice')
    end
  end

  def update_rating
    @comment = Comment.find_by(id: params[:id])
    if @comment && @comment.rate!(params[:comment][:rating_value]) 
      flash.now[:notice] = t('.notice')
    else
      flash.now[:error] = @comment.errors.present? ? @comment.errors.full_messages.join(' ') : t('.error')
    end
  end

  private

  def create_params
    params.require(:comment).permit(:comment_text, :review_id)
  end

end
