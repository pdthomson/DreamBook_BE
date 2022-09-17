class Api::V1::CommentsController < ApplicationController
before_action :find_blog, only: [:index, :create, :update, :destroy]

  def index
    render json: CommentSerializer.create_comments(@blog.comments)
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: CommentSerializer.create_comment(comment), status: 201
    else
      render status: 400
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update!(comment_params)
    render json: comment
  end

  def destroy
    render json: Comment.destroy(params[:id]), status: 204
  end


  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

  private

  def comment_params
    params.permit(:comment_text, :user_id, :blog_id)
    # params.require(:comment)permit(:comment_text, :user_id, :blog_id)
  end
end
