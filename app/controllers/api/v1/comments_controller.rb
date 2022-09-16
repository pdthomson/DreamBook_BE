class Api::V1::CommentsController < ApplicationController
# before_action :find_blog, only: [:index]

  def index
    blog = Blog.find(params[:blog_id])
    comments = blog.comments
    # binding.pry
    render json: BlogSerializer.create_blog(blog, comments)
  end

  # def find_blog
  #   @blog = Blog.find(params[:blog_id])
  # end
end
