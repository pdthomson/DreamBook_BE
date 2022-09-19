class MovieService 
  class << self 
    def movie_keyword_recommendations(keyword)
      response = conn.get("/3/search/movie?api_key=#{ENV["movie_api_key"]}&language=en-US&query=#{keyword}")
      json = JSON.parse(response.body, symbolize_names: true)
    end
  end 

  private 

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['X-API-Key'] = ENV["movie_api_key"]
    end
  end
end