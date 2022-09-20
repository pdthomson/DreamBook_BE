class BookSerializer
  class << self
    def get_book_recommendation(book_data)
      {
        data: book_data[:docs].map do |book|
          if book[:author_name].blank? || book[:title].nil? || book[:key].nil?
            {
            id: '000000000',
            type: 'n/a',
            attributes: {
              title: 'n/a',
              author: ['n/a', 'n/a'].first
            }
          }
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
