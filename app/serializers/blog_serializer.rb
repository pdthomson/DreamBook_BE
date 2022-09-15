class BlogSerializer 
  class << self
    def create_blogs(blogs)
      { 
        data: blogs.map do |blog|
          {
            id: "#{blog.id}", 
            type: "blog",
            attributes: {
              title: blog.title,
              body: blog.body,
              status: blog.status,
              user_id: blog.user_id
            }
          }
        end
      }
    end
  end
end 