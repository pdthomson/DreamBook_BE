class MovieService 
  class << self 
    def movie_keyword_recommendations(keyword)
      get_url("/3/search/movie?api_key=#{ENV["movie_api_key"]}&language=en-US&query=#{keyword}")
    end

    def get_url(url, keyword = nil)
      conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
        faraday.params['X-API-Key'] = ENV["movie_api_key"]
      end
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
  end 
end








