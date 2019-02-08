class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: :create
  respond_to :js, only: %i[create destroy]

  def create
    @comment = @commentable.comments.new do |comment|
      comment.comment = params[:comment_text]
      comment.user = current_user
    end
    @comment.save
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment_id = params[:id]
    @comment.destroy
    # redirect_to post_path(@comment.commentable_id)
  end

  private

  def find_commentable
    @commentable_type = params[:commentable_type].classify
    @commentable = @commentable_type.constantize.find(params[:commentable_id])
  end
end
