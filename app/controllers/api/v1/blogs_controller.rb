class Api::V1::BlogsController < ApplicationController
  def index
    render json: BlogSerializer.create_blogs(Blog.all)
  end


end