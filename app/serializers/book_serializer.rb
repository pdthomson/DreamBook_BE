class BookSerializer
  class << self
    def get_book_recommendation(book_data)
      {
        data: book_data[:docs].map do |book|
          if book[:author_name].blank?
            book[:author_name] = ''
          elsif book[:attributes].nil?
            book[:attributes]= ''
          else
          {
            id: "#{book[:key]}",
            type: "book",
            attributes: {
              title: book[:title],
              author: book[:author_name].first
              }
            }
          end
        end
      }
    end
  end
end
