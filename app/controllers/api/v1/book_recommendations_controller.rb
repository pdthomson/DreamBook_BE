class Api::V1::BookRecommendationsController < ApplicationController

  def index
    api_call = BookService.book_keyword_recommendations(params[:keyword])

    render json: BookSerializer.get_book_recommendation(api_call)
  end
end
