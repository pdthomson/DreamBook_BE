class Api::V1::BlogsController < ApplicationController
  def index
    render json: BlogSerializer.create_blogs(Blog.all)
  end

  def show
    render json: BlogSerializer.create_blog(Blog.find(params[:id]))
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: BlogSerializer.create_blog(blog), status: 201
    else
      render status: 400
    end
  end

  def update
    blog = Blog.find(params[:id])
		blog.update!(blog_params)
		render json: blog
  end

  private

  def blog_params
    params.permit(:id, :title, :body, :user_id, :status)
  end
end
