class MovieSerializer 
  class << self 
    def get_movie_recommendations(movie_data)

      {
        data: movie_data[:results].map do |movie|
          {
            id: movie[:id],
            type: "movie",
            attributes: {
              title: movie[:title],
              description: movie[:overview]
              }
            }
        end
      }
    end
  end
end