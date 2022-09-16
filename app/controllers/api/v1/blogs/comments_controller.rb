class Api::V1::Blogs::CommentsController < ApplicationController
before_action :find_blog, only: [:index, :create, :update, :destroy]

  def index
    render json: CommentSerializer.create_comments(@blog.comments)
  end



  def find_blog
    blog = Blog.find(params[:blog_id])
  end

end
