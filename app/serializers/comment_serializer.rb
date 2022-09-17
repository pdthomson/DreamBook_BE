class CommentSerializer
  class << self
    def create_comments(comments)
      {
        data: comments.map do |comment|
          {
            id: "#{comment.id}",
            type: "comment",
            attributes: {
              user_id: comment.user_id,
              blog_id: comment.blog_id,
              comment_text: comment.comment_text
              }
            }
        end
      }
    end
    def create_comment(comment)
      {
        data:
          {
            id: "#{comment.id}",
            type: "comment",
            attributes: {
              user_id: comment.user_id,
              blog_id: comment.blog_id,
              comment_text: comment.comment_text
              }
            }
      }
    end
  end
end
