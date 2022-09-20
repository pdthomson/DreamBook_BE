class BookService

  class << self

    def get_url(url)
      conn = Faraday.new(url: 'https://openlibrary.org/')
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def book_keyword_recommendations(keyword)
      # binding.pry
      get_url("http://openlibrary.org/search.json?q=#{keyword}")
    end
  end
end
