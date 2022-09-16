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

    def create_blog(blog)
      # binding.pry
      # if comments.nil?
      {
        data:
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
      }
    # else
      # {
      #   data:
      #   {
      #       id: "#{blog.id}",
      #       type: "blog",
      #       attributes: {
      #         title: blog.title,
      #         body: blog.body,
      #         status: blog.status,
      #         user_id: blog.user_id
              # {
              #   comments.map do |comment|
              #     comment_text: comment.comment_text,
              #     user_id: comment.user_id
              #   end
              # }
      #         }
      #     }
      # }
      # end
    end
  end
end
