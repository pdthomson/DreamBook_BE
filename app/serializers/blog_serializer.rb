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
              user_id: blog.user_id,
              keyword: blog.keyword
              }
            }
        end
      }
    end

    def create_blog(blog)
      {
        data:
        {
            id: "#{blog.id}",
            type: "blog",
            attributes: {
              title: blog.title,
              body: blog.body,
              status: blog.status,
              user_id: blog.user_id,
              keyword: blog.keyword
              }
          }
      }
    end
  end
end
