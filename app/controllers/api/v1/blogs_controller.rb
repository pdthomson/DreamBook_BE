class Api::V1::BlogsController < ApplicationController
  def index
    render json: BlogSerializer.create_blogs(Blog.all)
  end

  def show
    render json: BlogSerializer.create_blog(Blog.find(params[:id]))
  end


  private

  def blog_params
    params.permit(:id, :title, :body, :user_id, :status)
  end
end
